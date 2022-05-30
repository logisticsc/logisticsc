$apiToken = "5557966069:AAGvhAwYnmlkL0_zw00mU3N0Dlin21hCrVU";

$data = [
    'chat_id' => '@adamimk',
    'text' => 'Hello world!'
];

$response = file_get_contents("https://api.telegram.org/bot$apiToken/sendMessage?" . http_build_query($data) );
// Do what you want with result
