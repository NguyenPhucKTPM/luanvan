<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Auth;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Cache;
use Google\Client as GoogleClient;

class ChatController extends Controller
{
    private $dialogflowUrl;
    private $accessToken;
    public function __construct()
    {
        $this->dialogflowUrl = 'https://dialogflow.googleapis.com/v2/projects/chatbox-k9lg/agent/sessions/%s:detectIntent';
        $this->accessToken = $this->getAccessToken();
    }


    public function handleRequest(Request $request)
    {
        $userMessage = $request->input('message');
        
        $sessionId = session()->getId();
        $userId = Auth::check() ? Auth::user()->id_NguoiDung : $sessionId; 

        $chatMessages = Auth::check() ? Cache::get('chat_messages_' . $userId, []) : session()->get('chat_messages', []);

        $chatMessages[] = [
            'message' => $userMessage,
            'sender' => 'user'
        ];

        $client = new Client();
        $response = $client->post(sprintf($this->dialogflowUrl, $userId), [
            'headers' => [
                'Authorization' => 'Bearer ' . $this->accessToken,
                'Content-Type' => 'application/json',
            ],
            'json' => [
                'queryInput' => [
                    'text' => [
                        'text' => $userMessage,
                        'languageCode' => 'vi', // Ngôn ngữ tiếng Việt
                    ],
                ],
            ],
        ]);

        // Lấy phản hồi từ bot
        $botMessage = json_decode($response->getBody()->getContents(), true)['queryResult']['fulfillmentText'];

        // Thêm phản hồi của bot vào lịch sử chat
        $chatMessages[] = [
            'message' => $botMessage,
            'sender' => 'bot'
        ];

        if (Auth::check()) {
            Cache::put('chat_messages_' . $userId, $chatMessages, 60 * 60); // Lưu trong cache 1 giờ
        } else {
            session()->put('chat_messages', $chatMessages); // Lưu vào session nếu chưa đăng nhập
        }

        return response()->json(['queryResult' => ['fulfillmentText' => $botMessage]]);
    }

    public function getChatHistoryAfterLogin()
    {
        if (Auth::check()) {
            $userId = Auth::user()->id_NguoiDung;
            $chatMessages = Cache::get('chat_messages_' . $userId, []);
            return response()->json($chatMessages);
        }
        return response()->json([]);
    }
    private function getAccessToken()
    {
        $client = new \Google\Client();
        $client->setAuthConfig(storage_path('app/google-credentials.json'));
        $client->addScope('https://www.googleapis.com/auth/cloud-platform');

        return $client->fetchAccessTokenWithAssertion()['access_token'];
    }
}
