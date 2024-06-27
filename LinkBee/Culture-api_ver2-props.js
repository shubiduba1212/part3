// CultureApi.js 파일에서 useEffect 훅 내부에서 [setData]를 의존성 배열(dependency array)로 설정하는 이유는 다음과 같습니다:

//     useState와 useEffect의 관계: setData는 useState 훅으로 상태를 관리할 때 반환되는 setter 함수입니다. React에서 상태를 업데이트하려면 해당 setter 함수를 사용해야 합니다. setData 함수가 변경되지 않도록 보장하려면, 해당 함수를 useEffect의 의존성 배열에 명시해야 합니다. 이렇게 하면 React는 setData 함수가 변경될 때마다 useEffect를 다시 실행합니다.

//     무한 루프 방지: useEffect 내에서 데이터를 설정할 때 매번 새로운 데이터를 생성하는 경우, setData 함수가 의존성 배열에 없어도 되지만, 일반적으로 데이터를 설정할 때는 이전과 동일한 setter 함수를 사용합니다. 이 경우, setData를 의존성 배열에 추가하여 React가 무한 루프에 빠지지 않도록 합니다.

//     정확한 의존성 관리: useEffect 훅은 의존성 배열에 명시된 상태나 프롭스가 변경될 때만 실행됩니다. 따라서 setData를 의존성 배열에 포함시킴으로써, setData 함수가 호출될 때만 useEffect 내의 코드 블록이 실행되게 할 수 있습니다. 이는 의도치 않은 코드 실행을 방지하고 효율적인 리렌더링을 유지하는 데 도움이 됩니다.

// 따라서 setData를 [setData] 형태로 의존성 배열에 명시함으로써 React가 데이터 업데이트 시의 라이프사이클을 올바르게 관리할 수 있습니다.


import { useEffect} from "react";

export default function CultureApi({ setData }) {

  useEffect(() => {
    const serviceKey = '8/QFvrhFxUkbFccDXVjo2OKIiDWufUA8v2jGrIaDSWRqL499Gznzk7NYdHxvIoOvbJes6wYSeXMEgXHhyUxS9g==';
    const xhr = new XMLHttpRequest();
    const url = '/api/openapi/rest/publicperformancedisplays/realm';
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
        const xmlText = xhr.responseText;
        const parser = new DOMParser();
        const xmlDom = parser.parseFromString(xmlText, 'application/xml');
        const jsonData = xmlToJson(xmlDom);
        setData(jsonData); // App.js에서 전달받은 setData 함수를 호출하여 데이터 설정
      } else {
        // 오류 처리
        console.error('Network response was not ok ' + xhr.statusText);
      }
    };

    xhr.onerror = function () {
      // 네트워크 오류 처리
      console.error('XMLHttpRequest failed');
    };

    xhr.send();
  }, [setData]);

  // XML을 JSON으로 변환하는 함수
  const xmlToJson = (xml) => {
    const result = {};
    const root = xml.documentElement;

    const parseNode = (node) => {
      const obj = {};
      if (node.nodeType === Node.ELEMENT_NODE && node.attributes.length > 0) {
        for (const attr of node.attributes) {
          obj[attr.nodeName] = attr.nodeValue;
        }
      }
      if (node.hasChildNodes()) {
        for (const child of node.childNodes) {
          if (child.nodeType === Node.ELEMENT_NODE) {
            if (child.childNodes.length === 1 && child.firstChild.nodeType === Node.TEXT_NODE) {
              obj[child.nodeName] = child.textContent.trim();
            } else {
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

    result[root.nodeName] = parseNode(root);
    return result;
  };

  return null;
}