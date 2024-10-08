const chatButton = document.getElementById('chatButton');
const chatBox = document.getElementById('chatBox');
const closeChat = document.getElementById('closeChat');
const chatInput = document.getElementById('chatInput');
const sendButton = document.querySelector('.send-button');
const emojiButton = document.querySelector('.emoji-button');

chatButton.addEventListener('click', () => {
    chatBox.style.display = 'flex';
    chatButton.style.display = 'none';
});

closeChat.addEventListener('click', () => {
    chatBox.style.display = 'none';
    chatButton.style.display = 'flex';
});

chatInput.addEventListener('input', function() {
    if (this.value.trim() !== '') {
        sendButton.style.display = 'block';
        emojiButton.style.display = 'none';
    } else {
        sendButton.style.display = 'none';
        emojiButton.style.display = 'block';
    }
});