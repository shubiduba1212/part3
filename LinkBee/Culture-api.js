import { useEffect, useState } from "react";

export default function CultureApi() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(
    () => {
      const fetchData = async () => {
        // const url = 'http://www.culture.go.kr/openapi/rest/publicperformancedisplays/realm';
        //8/QFvrhFxUkbFccDXVjo2OKIiDWufUA8v2jGrIaDSWRqL499Gznzk7NYdHxvIoOvbJes6wYSeXMEgXHhyUxS9g==
        //
        // const serviceKey = '8/QFvrhFxUkbFccDXVjo2OKIiDWufUA8v2jGrIaDSWRqL499Gznzk7NYdHxvIoOvbJes6wYSeXMEgXHhyUxS9g=='; // 디코딩 상태의 service key
        //const encodedServiceKey = encodeURIComponent(serviceKey); // encoding 된 service key

        const url = '/api/openapi/rest/publicperformancedisplays/realm';
        // const queryParams = new URLSearchParams({
        //   serviceKey: serviceKey,
        //   keyword: '',
        //   sortStdr: '3',
        //   ComMsgHeader: '',
        //   RequestTime: '20240701:23003422',
        //   CallBackURI: '',
        //   MsgBody: '',
        //   cPage: '1',
        //   rows: '500',
        //   from: '20240701',
        //   to: '20241201'
        // });

        // try {

        //   console.log('Fetching data...');
        //   const response = await fetch(`${url}?${queryParams.toString()}`); // fetch로 api 호출
        //   console.log('Response received:', response);

        //   if (!response.ok) { // response가 ok가 아니라면,
        //     throw new Error('Network response was not ok ' + response.statusText);
        //   }

        //   // XML 데이터를 텍스트로 변환
        //   const xmlText = await response.text();
        //   console.log('Response XML text:', xmlText);

        // } catch (error) {
        //   setError(error);
        // } finally {
        //   setLoading(false);
        // }
      };
      const encodingHandler = () => {
        queryParams += '&' + encodeURIComponent(pramName) + '=' + encodeURIComponent(params);
      }


          const xhr = new XMLHttpRequest();
          const url = '/api/openapi/rest/publicperformancedisplays/realm'; /*URL*/
var queryParams = encodeURIComponent('serviceKey') + '='+'8/QFvrhFxUkbFccDXVjo2OKIiDWufUA8v2jGrIaDSWRqL499Gznzk7NYdHxvIoOvbJes6wYSeXMEgXHhyUxS9g=='; /*Service Key*/
queryParams += '&' + encodeURIComponent('keyword') + '=' + encodeURIComponent(''); /**/
queryParams += '&' + encodeURIComponent('sortStdr') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('ComMsgHeader') + '=' + encodeURIComponent(''); /**/
queryParams += '&' + encodeURIComponent('RequestTime') + '=' + encodeURIComponent('20100810:23003422'); /**/
queryParams += '&' + encodeURIComponent('CallBackURI') + '=' + encodeURIComponent(''); /**/
queryParams += '&' + encodeURIComponent('MsgBody') + '=' + encodeURIComponent(''); /**/
queryParams += '&' + encodeURIComponent('from') + '=' + encodeURIComponent('20240701'); /**/
queryParams += '&' + encodeURIComponent('to') + '=' + encodeURIComponent('20241231'); /**/
queryParams += '&' + encodeURIComponent('cPage') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('rows') + '=' + encodeURIComponent('500'); /**/
        xhr.open('GET', `${url}?${queryParams.toString()}`, true);

        xhr.onload = function () {
          if (xhr.status >= 200 && xhr.status < 300) {
            // 성공적으로 데이터를 받았을 때 처리
            const xmlText = xhr.responseText;
            console.log('Response XML text:', xmlText);
            // 여기서 xmlText를 원하는 방식으로 처리 (파싱 등)
          } else {
            // 오류 처리
            setError(new Error('Network response was not ok ' + xhr.statusText));
          }
          setLoading(false); // 로딩 상태 변경
        };

        xhr.onerror = function () {
          // 네트워크 오류 처리
          setError(new Error('XMLHttpRequest failed'));
          setLoading(false); // 로딩 상태 변경
        };

        xhr.send();

      // fetchData();

    }, []
  );
  return (
    <>
      <h1>Api 호출 test</h1>
    </>
  );
}