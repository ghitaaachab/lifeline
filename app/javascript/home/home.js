let currentReviewIndex = 0;
const reviews = [
  {
    id: 1,
    name: "Sara Jones",
    img:
      "https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049__340.png",
    text:
      "I really like this web app it is help me to manage my health data and it is very easy to use."
  },
  {
    id: 2,
    name: "John Doe",
    img:
      "https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049__340.png",
    text:
      "I really like this web app it is help me to manage my health data and it is very easy to use."
  },
  {
    id: 3,
    name: "Mieckel non",
    img:
      "https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814049__340.png",
    text:
      "I really like this web app it is help me to manage my health data and it is very easy to use."
  },
];

const img = document.getElementById("person-img");
const author = document.getElementById("author");
const info = document.getElementById("info");

const prevBtn = document.querySelector(".prev-btn");
const nextBtn = document.querySelector(".next-btn");

let currentItem = 0;

// load initial item
window.addEventListener("DOMContentLoaded", () => {
  showPerson(currentReviewIndex);
});


// show person based on item
function showPerson(index) {
  const item = reviews[index];
  img.src = item.img;
  author.textContent = item.name;
  info.textContent = item.text;
}

// show next person
nextBtn.addEventListener("click", () => {
  currentReviewIndex++;
  if (currentReviewIndex >= reviews.length) {
    currentReviewIndex = 0;
  }
  showPerson(currentReviewIndex);
});
// show prev person
prevBtn.addEventListener("click", () => {
  currentReviewIndex--;
  if (currentReviewIndex < 0) {
    currentReviewIndex = reviews.length - 1;
  }
  showPerson(currentReviewIndex);
});
