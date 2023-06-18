document.querySelectorAll('.star-rating .star').forEach(star => {
  star.addEventListener('click', function() {
    let rating = this.dataset.value;
    document.getElementById('rating').value = rating;
    this.parentNode.querySelectorAll('.star').forEach(otherStar => {
      otherStar.style.color = otherStar.dataset.value <= rating ? 'gold' : 'lightgray';
    });
  });
});


document.querySelector('form').addEventListener('submit', function(e) {
    if (document.getElementById('rating').value == 0) {
        alert('평점을 입력해주세요!');
        e.preventDefault(); 
    }
});
