import React from 'react';
import './Login.css';

const onNaverLogin = () => {

  window.location.href = "http://localhost:8081/oauth2/authorization/naver"
}
const onKakaoLogin = () => {

  window.location.href = "http://localhost:8081/oauth2/authorization/kakao"
}
const onGoogleLogin = () => {

  window.location.href = "http://localhost:8081/oauth2/authorization/google"
}

function Login() {
  return (
    <div className="App">
      <main>
        <div className="login-container">
          <div className='logo-content'>
            <img className='midle-logo' src="images/commons/logo.png" alt="LOGO"/>
          </div>
          <div className="login-box">
          <p className='text'>소셜 계정 간편 로그인 & 가입</p>
            <button onClick={onNaverLogin} className="naver-login">네이버 로그인</button>
            <button onClick={onKakaoLogin} className="kakao-login">카카오 로그인</button>
            <button onClick={onGoogleLogin} className="google-login">Google 로그인</button>
          </div>
        </div>
      </main>
    </div>
  );
}

export default Login;
