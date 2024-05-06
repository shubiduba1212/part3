//header sub menu 활성화
const gnbMenu = document.querySelectorAll('.header_gnb > li > a');
const subMenu = document.querySelectorAll('.sub_menu');
gnbMenu.forEach(gnbmenu => {
  gnbmenu.addEventListener('mouseover', (e) => {
    e.currentTarget.nextElementSibling.classList.add("active");
  })  
  gnbmenu.addEventListener('mouseout', (e) => {
    e.currentTarget.nextElementSibling.classList.remove("active");
  })  
});

subMenu.forEach(submenu => {
  submenu.addEventListener('mouseover', (e) => {
    e.currentTarget.classList.add("active");
  })
  submenu.addEventListener('mouseout', (e) => {
    e.currentTarget.classList.remove("active");
  })
})