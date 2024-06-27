import { useEffect, useState } from "react";

export default function CultureApi() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(
    () => {
      // 디코딩 인증키
      //'8/QFvrhFxUkbFccDXVjo2OKIiDWufUA8v2jGrIaDSWRqL499Gznzk7NYdHxvIoOvbJes6wYSeXMEgXHhyUxS9g=='
      // 인코딩 인증키
      //8%2FQFvrhFxUkbFccDXVjo2OKIiDWufUA8v2jGrIaDSWRqL499Gznzk7NYdHxvIoOvbJes6wYSeXMEgXHhyUxS9g%3D%3D
      const serviceKey = '8/QFvrhFxUkbFccDXVjo2OKIiDWufUA8v2jGrIaDSWRqL499Gznzk7NYdHxvIoOvbJes6wYSeXMEgXHhyUxS9g==';
      const xhr = new XMLHttpRequest(); //XMLHttpRequest는 비동기 방식으로 작동하기 때문에, 데이터가 로드되기를 기다리지 않고 다른 작업을 계속할 수 있다.
      const url = '/api/openapi/rest/publicperformancedisplays/realm'; /*URL*/
      const queryParams = new URLSearchParams({
        serviceKey: serviceKey,
        keyword: '',
        sortStdr: '3',
        ComMsgHeader: '',
        RequestTime: '20240701:23003422',
        CallBackURI: '',
        MsgBody: '',
        cPage: '1',
        rows: '500',
        from: '20240701',
        to: '20241201'
      });

      xhr.open('GET', `${url}?${queryParams.toString()}`, true);

      xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
          // 성공적으로 데이터를 받았을 때 처리
          const xmlText = xhr.responseText;
          console.log('Response XML text:', xmlText);
          // 여기서 xmlText를 원하는 방식으로 처리 (파싱 등)
          // DOMParser를 사용하여 XML을 JSON으로 변환
          const parser = new DOMParser();
          const xmlDom = parser.parseFromString(xmlText, 'application/xml');
          const jsonData = xmlToJson(xmlDom);
          console.log('Parsed XML to JSON:', jsonData);
          setData(jsonData);

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
    }, []
  );

  // XML을 JSON으로 변환하는 함수
  const xmlToJson = (xml) => {
    // 결과 JSON 객체
    const result = {};

    // XML DOM에서 루트 요소 가져오기
    const root = xml.documentElement;
    console.log("root : xml.documentElement ->" + root);

    // 재귀적으로 요소를 순회하며 JSON 객체로 변환하는 함수
    const parseNode = (node) => {
      const obj = {};

      // 요소의 속성을 JSON 객체에 추가
      if (node.nodeType === Node.ELEMENT_NODE && node.attributes.length > 0) {
        for (const attr of node.attributes) {
          obj[attr.nodeName] = attr.nodeValue;
          console.log("attr : "+attr);
          console.log("obj : "+obj);
        }
      }

      // 자식 노드가 있을 경우 재귀적으로 처리
      if (node.hasChildNodes()) {
        for (const child of node.childNodes) {
          if (child.nodeType === Node.ELEMENT_NODE) {
            if (child.childNodes.length === 1 && child.firstChild.nodeType === Node.TEXT_NODE) {
              // 텍스트 노드인 경우 값만 가져와서 문자열로 저장
              obj[child.nodeName] = child.textContent.trim();
            } else {
              // 자식 노드가 있는 경우 재귀적으로 처리
              if (!obj[child.nodeName]) {
                obj[child.nodeName] = [];
              }
              obj[child.nodeName].push(parseNode(child));
            }
          }
        }
      }

      return obj;
    };

    // 루트 요소부터 시작하여 재귀적으로 JSON 객체로 변환
    result[root.nodeName] = parseNode(root);

    return result;
  };
}