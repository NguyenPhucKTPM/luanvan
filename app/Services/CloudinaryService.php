<?php

namespace App\Services;

use Cloudinary\Cloudinary;

class CloudinaryService
{
    protected $cloudinary;

    public function __construct()
    {
        // Khởi tạo Cloudinary với cấu hình từ file .env
        $this->cloudinary = new Cloudinary([
            'cloud' => [
                'cloud_name' => config('cloudinary.cloud_name'),
                'api_key'    => config('cloudinary.api_key'),
                'api_secret' => config('cloudinary.api_secret'),
            ],
        ]);
    }

    /**
     * Tải hình ảnh lên Cloudinary.
     *
     * @param \Illuminate\Http\UploadedFile $file
     * @param string $folder
     * @return string
     */
    public function uploadImage($file, $folder = 'luanvan')
    {
        // Tải ảnh lên Cloudinary và chỉ định thư mục
        $uploadedFile = $this->cloudinary->uploadApi()->upload($file->getRealPath(), [
            'folder' => $folder,
        ]);

        // Trả về thông tin chi tiết bao gồm public_id và secure_url
        return [
            'public_id' => $uploadedFile['public_id'],
            'secure_url' => $uploadedFile['secure_url'],
        ];
    }
    public function deleteImage($publicId)
    {
        $result = $this->cloudinary->uploadApi()->destroy($publicId);

        return $result;
    }
}
