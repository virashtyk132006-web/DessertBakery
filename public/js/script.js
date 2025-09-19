const navbar = document.querySelector('.navbar');
const searchForm = document.querySelector('.search-form');
const cartItem = document.querySelector('.cart-items-container');

document.querySelector('#search-btn')?.addEventListener('click', () => {
  searchForm?.classList.toggle('active');
  navbar?.classList.remove('active');
  cartItem?.classList.remove('active');
});

document.querySelector('#cart-btn')?.addEventListener('click', () => {
  cartItem?.classList.toggle('active');
  navbar?.classList.remove('active');
  searchForm?.classList.remove('active');
});

window.addEventListener('scroll', () => {
  navbar?.classList.remove('active');
  searchForm?.classList.remove('active');
  cartItem?.classList.remove('active');
});
