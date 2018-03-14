import "slick-carousel";

const initializeSlickCarousel = () => {
  $(".users_list").slick({
    arrows: false,
    centerMode: true,
  centerPadding: '30px',
  slidesToShow: 1,
  swipe: true,
  mobileFirst: true
  });
}

export { initializeSlickCarousel };
