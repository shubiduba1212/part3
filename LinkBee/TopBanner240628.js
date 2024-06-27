import '../../styles/slick-theme.css';
import '../../styles/slick.css';
import mainStyle from '../../pages/main/Main.module.css';
import Slider from "react-slick";
import { Link } from 'react-router-dom';

export default function TopBanner(cultureList) {
  //cultureList.msgBody[0].perforList[].thumbnail
  const settings = {
    className: "center",
    centerMode: true,
    infinite: true,
    centerPadding: "60px",
    slidesToShow: 3,
    speed: 1000,
    dots: true,
    autoplay : true,
    autoplaySpeed : 3000,
    pauseOnHover : true,
    arrows : false,
  };
  return (
    <div className={`slider-container ${mainStyle.top_banner_box}`}>
      <Slider {...settings}>
        {[...Array(parseInt(10))].map((n, index) => {
          <div className={mainStyle.centerList} key={index}>
            <Link to="/cultureinfo/detail">
              <img src={cultureList.response.msgBody[0].perforList[index].thumbnail} alt={`${cultureList.response.msgBody[0].perforList[index].thumbnail} thumbnail`}/>
            </Link>
          </div>
        })}                      
      </Slider>
    </div>
  );
}

{/* <div className={mainStyle.centerList}>
          <Link to="/cultureinfo/detail">
            <img src="https://images.unsplash.com/photo-1562329265-95a6d7a83440?w=1200&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YnJvYWR3YXklMjBtdXNpY2FsfGVufDB8fDB8fHww" alt="top banner"/>
          </Link>
        </div>
        <div className={mainStyle.centerList}>
          <Link to="/cultureinfo/detail">
            <img src="https://images.unsplash.com/photo-1545264835-3e14e4dae383?q=80&w=2548&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="top banner"/>
          </Link>
        </div>
        <div className={mainStyle.centerList}>
          <Link to="/cultureinfo/detail">
            <img src="https://images.unsplash.com/photo-1584448097764-374f81551427?q=80&w=2196&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="top banner"/>
          </Link>
        </div>
        <div className={mainStyle.centerList}>
          <Link to="/cultureinfo/detail">
            <img src="https://images.unsplash.com/photo-1563841930606-67e2bce48b78?q=80&w=2054&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="top banner"/>
          </Link>
        </div> */}

