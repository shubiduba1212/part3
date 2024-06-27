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
import Honey from './pages/socializing/Honey';
import CultureInfo from './pages/cultureInfo/CultureInfo';
import CompletedPage from './pages/login/CompletedPage'
import Detail from './pages/socializing/Detail';
import NoticeDetailPage from './pages/serviceCenter/NoticeDetail';
import CultureDetail from './pages/cultureInfo/CultureDetail';
import HoneyWrite from './pages/socializing/HoneyWrite';
import HoneyWrite2 from './pages/socializing/HoneyWrite2';
import HoneyWrite3 from './pages/socializing/HoneyWrite3';
import DoneResult from './pages/socializing/DoneResult';
import CultureApi from './apis/CultureApi';
import { useEffect, useState } from 'react';

export default function App() {
  const [data, setData] = useState(null);

  useEffect(
    () => {
      CultureApi({ setData });
    },[]
  );

    return (
   <>      
    <GlobalStyles/>
      <BrowserRouter>
          <Routes>
            <Route element={<Layout/>}> {/* 레이아웃 오픈*/}
              <Route path='/main' element={<Main/>}/> {/* 메인 */}
              <Route index element={<Main cultureList={JSON.stringify(data)}/>}/> {/* 메인 */}
              <Route path='/login' element={<LoginPage/>}/> {/* 로그인 */}
              <Route path='/signup' element={<SignUpPage/>}/> {/* 추가 정보 입력 */}
              <Route path="/cultureinfo" element={<CultureInfo/>}/> {/* 전시/공연 정보 */}
              <Route path="/cultureinfo/detail" element={<CultureDetail/>}/> {/* 전시/공연 상세페이지*/}
              {/*<Route path="/culture-api" element={<CultureApi/>}/>  전시/공연 공공 api*/}
              <Route path='/completed' element={<CompletedPage/>}/> {/* 회원 가입 완료 */}
              <Route path='/mypage' element={<MyPage/>}/> {/* 마이 페이지 */}
              <Route path='/help' element={<Cs />} /> {/* 고객 센터 */}
              <Route path='/faq' element={<Faq />} /> {/* 자주 찾는 질문 */}
              <Route path='/notice' element={<Notice />} /> {/* 공지사항 */}
              <Route path='/inquiry' element={<Inquiry />} /> {/* 1:1문의 */}
              <Route path='/noticedetail' element={<NoticeDetailPage />} /> {/*공지사항 상세페이지*/}
              <Route path='/honey' element={<Honey/>}/> {/* 허니팟 */}
              <Route path='/detail' element={<Detail/>}/> {/*허니팟 상세페이지*/}
              <Route path='/write-honey/step1' element={<HoneyWrite/>}/> {/* 허니팟 글쓰기페이지*/}
              <Route path='/write-honey/step2' element={<HoneyWrite2/>}/> {/* 허니팟 글쓰기페이지*/}
              <Route path='/write-honey/step3' element={<HoneyWrite3/>}/> {/* 허니팟 글쓰기페이지*/}
              <Route path='/result' element={<DoneResult/>}/> {/* 결과페이지 */} {/* useNavigate 사용시, state로 action 값에 담아 전달하면 됩니다.*/}
            </Route> 
            {/* 레이아웃 클로즈 */}              
          </Routes>
      </BrowserRouter>
     </>
    );
}