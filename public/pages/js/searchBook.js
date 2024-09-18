document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('search-input');
    const bookList = document.getElementById('book-list');
    let debounceTimer;

    function getRelevanceScore(title, searchTerms) {
        return searchTerms.filter(term => title.includes(term)).length;
    }

    searchInput.addEventListener('input', function() {
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(() => {
            const searchTerms = this.value.toLowerCase().split(' ').filter(term => term.length > 0);
            const bookItems = Array.from(bookList.querySelectorAll('.book-item'));

            if (searchTerms.length === 0) {
                // If no search terms, show all books
                bookItems.forEach(item => {
                    item.style.display = '';
                    bookList.appendChild(item); // Maintain original order
                });
            } else {
                const sortedBooks = bookItems.map(item => {
                    const titleElement = item.querySelector('h3 a');
                    const title = titleElement ? titleElement.textContent.toLowerCase() : '';
                    const relevanceScore = getRelevanceScore(title, searchTerms);
                    return {
                        item,
                        relevanceScore
                    };
                }).sort((a, b) => b.relevanceScore - a.relevanceScore);

                let hasVisibleItems = false;

                sortedBooks.forEach(({
                    item,
                    relevanceScore
                }) => {
                    if (relevanceScore > 0) {
                        item.style.display = '';
                        bookList.appendChild(item); // Move matching items to the end
                        console.log(`Showing: ${item.querySelector('h3 a').textContent} with score: ${relevanceScore}`);
                        hasVisibleItems = true;
                    } else {
                        item.style.display = 'none';
                        console.log(`Hiding: ${item.querySelector('h3 a').textContent}`);
                    }
                });

                // If no items are visible, show a message or handle it accordingly
                if (!hasVisibleItems) {
                    console.log('No books match the search criteria.');
                }
            }
        }, 300);
    });
});