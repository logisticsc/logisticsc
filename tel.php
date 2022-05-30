$apiToken = "5582926142:AAG97eIZhmzGVvEvKoCtzU7RMCAJUoppHcQ";

$data = [
    'chat_id' => '@dfgasq',
    'text' => 'Hello world!'
];

$response = file_get_contents("https://api.telegram.org/bot$apiToken/sendMessage?" . http_build_query($data) );
// Do what you want with result
