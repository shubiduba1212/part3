import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Layout from './layouts/Layout';
import GlobalStyles from './styles/GlobalStyles';
import LoginPage from './pages/login/LoginPage';
import SignUpPage from './pages/login/SignUp';
import MyPage from './pages/mypage/MyPage';
import Cs from './pages/serviceCenter/Cs';
import Faq from './pages/serviceCenter/Faq';
import Notice from './pages/serviceCenter/Notice';
import Inquiry from './pages/serviceCenter/Inquiry';
import Main from './pages/main/Main';
import CultureInfo from './pages/cultureInfo/CultureInfo';
import CompletedPage from './pages/login/CompletedPage'
import NoticeDetailPage from './pages/serviceCenter/NoticeDetail';
import CultureDetail from './pages/cultureInfo/CultureDetail';
import HoneypotPage from './pages/honeypot/HoneypotPage';
import CultureApi from './apis/CultureApi';
import { useEffect, useState } from 'react';
import LoadingSpinner from './components/commons/Loading';
import CultureDetailApi from './apis/CultureDetailApi';

export default function App() {

  // Api 호출시 상태 저장을 위한 설정
  const [data, setData] = useState(null);
  const [seqList, setSeqList] = useState([]);
  const [detailDataList, setDetailDataList] = useState({});

  useEffect(
    () => {
      CultureApi({ setData }); // App.js의 setData함수를 객체 형태로 CultureApi 컴포넌트에 props로 전달
    },[]
  );

  useEffect(() => {
    console.log(data); // 데이터가 변경될 때마다 로그를 출력
    if (data?.perforList) {
      console.log("data length : " + data.perforList.length);
      const newSeqList = data.perforList.map(perfor => perfor.seq);
      setSeqList(newSeqList);
      for (let i = 0; i < data.perforList.length; i++) {
        console.log("seq : " + data.perforList[i].seq);
      }
    }    
  }, [data]);

  useEffect(() => {
    // seqList가 변경될 때마다 CultureDetailApi 호출
    seqList.forEach(seq => {
      CultureDetailApi({
        setDetailData: detailData => {
          setDetailDataList(prev => ({ ...prev, [seq]: detailData }));
        }
        //prev는 현재의 detailDataList 상태를 나타낸다. 이전 상태를 변경하지 않고 새로운 객체를 반환하기 위해 함수형 업데이트를 사용
        // { ...prev }: 기존의 detailDataList 상태를 복사
        // [seq]: detailData: 새로운 detailData를 seq를 key로 하는 새로운 항목으로 추가
        // 예를 들어, seq가 279065인 경우에는 detailDataList[279065]에 해당하는 값이 detailData로 설정
      }, seq);
    });
  }, [seqList]);

    return (
   <>      
    <GlobalStyles/>
      <BrowserRouter>
          <Routes>
            <Route element={<Layout/>}> {/* 레이아웃 오픈*/}
              <Route path='/main' element={data ? <Main cultureList={JSON.stringify(data)}/> : <LoadingSpinner />}/> {/* 메인 */}
              <Route index element={data ? <Main cultureList={JSON.stringify(data)}/> : <LoadingSpinner />}/> {/* 메인 */}
              <Route path='/login' element={<LoginPage/>}/> {/* 로그인 */}
              <Route path='/signup' element={<SignUpPage/>}/> {/* 추가 정보 입력 */}
              <Route path="/cultureinfo" element={data ? <CultureInfo cultureList={JSON.stringify(data)} detailDataList={detailDataList}/> : <LoadingSpinner />}/> {/* 전시/공연 정보 */}
              <Route path="/cultureinfo/detail/:seq" element={<CultureDetail/>}/> {/* 전시/공연 상세페이지*/}
              <Route path='/completed' element={<CompletedPage/>}/> {/* 회원 가입 완료 */}
              <Route path='/honeypot' element={<HoneypotPage/>}/> {/* 허니팟 페이지 */}
              <Route path='/mypage' element={<MyPage/>}/> {/* 마이 페이지 */}
              <Route path='/help' element={<Cs />} /> {/* 고객 센터 */}
              <Route path='/faq' element={<Faq />} /> {/* 자주 찾는 질문 */}
              <Route path='/notice' element={<Notice />} /> {/* 공지사항 */}
              <Route path='/inquiry' element={<Inquiry />} /> {/* 1:1문의 */}
              <Route path='/noticedetail' element={<NoticeDetailPage />} /> {/*공지사항 상세페이지*/}
            </Route> 
            {/* 레이아웃 클로즈 */}              
          </Routes>
      </BrowserRouter>
     </>
    );
}
