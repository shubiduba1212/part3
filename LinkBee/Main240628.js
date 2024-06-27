import mainStyles from './Main.module.css';
import TopBanner from '../../components/main/TopBanner';
import HotBanner from '../../components/main/HotBanner';
import EarlyBanner from '../../components/main/EarlyBanner';
import { useEffect } from "react";
import { useNavigate } from 'react-router-dom';
import { useState } from 'react';

export default function Main(props) {

  const [cultureList, setCultureList] = useState(null);
  ////element={data ? <Main cultureList={data}/> : <div>Loading...</div>}
  //element={<Main cultureList={data == null ? "api not called" : JSON.stringify(data)}/>}
  //<Route index element={data ? <Main cultureList={JSON.stringify(data)}/> : <LoadingSpinner />}/> {/* 메인 */}
  
  const navigate = useNavigate();

  // 스크롤시 Header 색상 변경 
  useEffect(
    () => {
      
      if (props.cultureList) {
        setCultureList(props.cultureList);
        console.log(props.cultureList); // props.cultureList 출력
      }
      // setCultureList(props.cultureList);
      // console.log(cultureList);
      // console.log('api 데이터 리스트 전달 : ' + props.cultureList.perforList[0]);      
      //.msgBody[0].perforList[index].thumbnail
      // console.log('api 데이터 리스트 전달 : ' + props.cultureList.response);
      // console.log('api 데이터 리스트 전달 : ' + props);
      // console.log('api 데이터 리스트 전달 : ' + props.cultureList);
      // console.log('api 데이터 리스트 전달 : ' + JSON.stringify(props.cultureList));
      // console.log('api 데이터 리스트 전달 : ' + props.cultureList);
      //.msgBody[0].perforList[index].thumbnail 
      // document.querySelector(".header").classList.add("main");     
      // const changeHeaderBgColor = () => {
      //   if(window.scrollY > 80){ // 스크롤 위치가 header height 80px보다 내려갔을 경우,
      //     document.querySelector(".header").classList.remove("main"); // header에서 main 클래스 제거
      //     //src="images/commons/logo.png"          
      //     document.querySelector(".header-logo").setAttribute('src','images/commons/logo.png'); //유색 로고로 변경      
      //   } else if (window.scrollY < 80) {// 스크롤 위치가 header height 80px를 벗어나지 않은 경우,
      //     document.querySelector(".header").classList.add("main");  // header에서 main 클래스 추가
      //     document.querySelector(".header-logo").setAttribute('src','images/commons/logo_white.png'); //흰색 로고로 변경     
      //   }
      // }
      // window.addEventListener("scroll", changeHeaderBgColor);

      // return () => {
      //   window.removeEventListener("scroll", changeHeaderBgColor);
      //   header.classList.remove("main"); // 컴포넌트가 언마운트될 때 클래스 제거
      // }
    },[props.cultureList]
  );

  useEffect(
    () => {
      window.scrollTo(0,0); //페이지 이동시, 최상단으로 스크롤 위치
      
      const header = document.querySelector(".header");
      header.classList.add("main");
      document.querySelector(".header-logo").setAttribute('src', 'images/commons/logo_white.png');

      const changeHeaderBgColor = () => {
        if (window.scrollY > 80) {
          header.classList.remove("main");
          document.querySelector(".header-logo").setAttribute('src', 'images/commons/logo.png');
        } else {
          header.classList.add("main");
          document.querySelector(".header-logo").setAttribute('src', 'images/commons/logo_white.png');
        }
      };
      
      window.addEventListener("scroll", changeHeaderBgColor);

      return () => {
        window.removeEventListener("scroll", changeHeaderBgColor);
        header.classList.remove("main"); // 컴포넌트가 언마운트될 때 클래스 제거
        document.querySelector(".header-logo").setAttribute('src', 'images/commons/logo.png');
      };
    },[]
  );

  // const perforList = props.cultureList?.response.msgBody[0].perforList;
  // console.log(cultureList.totalCount);

	return (
		<>
		{/* contents */}
    <div className={mainStyles.contents_cont}>
      <div className={mainStyles.main_sec_box}>
        <div className={mainStyles.main_sec}>
          <div className={`${mainStyles.main_tit} ${mainStyles.flex_center}`}><img src={`${process.env.PUBLIC_URL}/images/commons/logo_white.png`} alt="Link bee logo white"/><p className={`${mainStyles.sec_tit} ${mainStyles.white}`}>링크비 Picks</p></div>
          {/* Top Banner */}
          {/* {TopBanner(cultureList)} */}
          
          <div className={mainStyles.hot_prf_sec}>
            <div className={`${mainStyles.tit_view_more} ${mainStyles.flex_center}`}>
              <p className={mainStyles.sec_tit}>HOT 전시/공연 정보</p>
              <span className={`${mainStyles.view_more_btn} ${mainStyles.flex_center}`} onClick={() => navigate("/cultureinfo")}>더보기 <img src={`${process.env.PUBLIC_URL}/images/commons/icon_arrow_right_white.png`} alt="arrow left direction icon"/></span>
            </div>
            {HotBanner()}
          </div>
  
          {/* 얼리버드 전시/공연 정보 */}
          <div className={mainStyles.early_sec_box}>
            <div className={mainStyles.early_sec}>
              <div className={`${mainStyles.tit_view_more} ${mainStyles.flex_center}`}>
                <p className={mainStyles.sec_tit}>얼리버드</p>
                <span className={`${mainStyles.view_more_btn} ${mainStyles.flex_center}`} onClick={() => navigate("/cultureinfo")}>더보기 <img src={`${process.env.PUBLIC_URL}/images/commons/icon_arrow_right_white.png`} alt="arrow left direction icon"/></span>
              </div>
              <div className={mainStyles.early_slide_box}>
                {EarlyBanner()}
              </div>
            </div>
          </div>
          {/* // 얼리버드 전시/공연 정보 */}
  
          {/* 허니팟 리스트 영역 */}
          <div className={mainStyles.honeypot_sec_box}>
            <div className={mainStyles.honeypot_sec}>
              <div className={`${mainStyles.tit_view_more} ${mainStyles.flex_center}`}>
                <p className={mainStyles.sec_tit}>허니팟</p>
                <span className={`${mainStyles.view_more_btn} ${mainStyles.flex_center}`} onClick={() => navigate("/honey")}>더보기 <img src={`${process.env.PUBLIC_URL}/images/commons/icon_arrow_right_white.png`} alt="arrow right direction icon"/></span>
              </div>
            </div>
          </div>
          {/* //허니팟 리스트 영역 */}
        </div>
      </div>
    </div>
    {/* //contents */}
		</>
	)
}

