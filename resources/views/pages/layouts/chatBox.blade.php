<div id="chatButton">
    <img src="{{ asset('pages/images/logo.png') }}" alt="logo">
</div>

<div id="chatBox">
    <div class="chat-header">
        <div style="display: flex; align-items: center;">
            <img src="{{ asset('pages/images/logo.png') }}" alt="GearVN" class="logo">
            <h5 style="color: #fff">Library CTUT Bot</h5>
        </div>
        <div>
            <i class="bi bi-x" style="font-size: 15px;" id="closeChat"></i>
        </div>
    </div>
    <div class="chat-body">
        <div class="message bot">
            <img src="{{ asset('pages/images/logo.png') }}" alt="logo">
            <div class="message-content">
                Chào mừng đến với thư viện của chúng tôi!
            </div>
        </div>
    </div>
    <div class="chat-footer">
        <button class="emoji-button"><i class="bi bi-emoji-smile"></i></button>
        <input type="text" placeholder="Nhập nội dung..." id="chatInput">
        <button class="send-button"><i class="bi bi-send-fill"></i></button>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $('.send-button').on('click', function() {
            sendMessage();
        });

      
        $('#chatInput').on('keypress', function(e) {
            if (e.which === 13) { // Phím Enter
                e.preventDefault(); 
                sendMessage();
            }
        });

        // Hàm gửi tin nhắn
        function sendMessage() {
            const userMessage = $('#chatInput').val(); // Lấy nội dung tin nhắn từ ô nhập
            if (userMessage.trim() === '') return; // Nếu không có nội dung, không làm gì cả

            // Hiển thị tin nhắn của người dùng trong chat box
            displayMessage(userMessage, 'user');

            // Gửi tin nhắn đến server
            $.ajax({
                url: '{{ route("handleRequest") }}', 
                method: 'POST',
                data: {
                    message: userMessage,
                    _token: '{{ csrf_token() }}' // Gửi CSRF token
                },
                success: function(response) {
                    const botMessage = response.queryResult.fulfillmentText; // Lấy phản hồi từ Dialogflow
                    displayMessage(botMessage, 'bot');
                },
                error: function(error) {
                    console.error('Error:', error);
                }
            });

            // Xóa ô nhập
            $('#chatInput').val('');
        }

        // Hàm hiển thị tin nhắn
        function displayMessage(message, type) {
            const messageContainer = $('<div class="message"></div>');
            if (type === 'user') {
                messageContainer.addClass('user'); // Thêm lớp cho tin nhắn người dùng
            } else {
                messageContainer.addClass('bot'); // Thêm lớp cho tin nhắn bot
                const logo = $('<img src="{{ asset('pages/images/logo.png') }}" alt="logo">');
                messageContainer.append(logo);
            }
            const messageContent = $('<div class="message-content"></div>').text(message);

            messageContainer.append(messageContent);
            $('.chat-body').append(messageContainer);

            $('.chat-body').scrollTop($('.chat-body')[0].scrollHeight);
        }
    });
</script>