/* Javascript Sample*/
var xhr = new XMLHttpRequest();
var url = 'http://api.kcisa.kr/openapi/API_CCA_145/request'; /*URL*/
var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'bfeaa949-43d9-446e-bae2-a1ba8d625691'; /*서비스키*/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent(''); /*세션당 요청레코드수*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent(''); /*페이지수*/

xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
if (this.readyState == 4) {

console.log('status: ' + this.status);
console.log('responseText: ' + this.responseText);
console.log('resultCode: ' + this.responseText.search('resultCode'));
console.log('resultMsg: ' + this.responseText.search('resultMsg'));
const xmlText = xhr.responseText;
const parser = new DOMParser(); // XML 문자열을 파싱하기 위해 DOMParser 객체를 생성
const xmlDom = parser.parseFromString(xmlText, 'application/xml'); // XML 문자열을 XML DOM 객체로 변환
const jsonData = xmlToJson(xmlDom); // XML 데이터를 JSON 형식으로 변환
// setDetailData(jsonData.response.msgBody[0].perforInfo); // App.js에서 전달받은 setDetailData 함수를 호출하여 데이터 설정
console.log("from newApi : "+JSON.stringify(jsonData.response.body.items));
// JSON 데이터에서 item에 접근하여 데이터 출력
if (jsonData.response.body && jsonData.response.body[0] && jsonData.response.body[0].items && jsonData.response.body[0].items[0] && jsonData.response.body[0].items[0].item) {
        const items = jsonData.response.body[0].items[0].item;
        //cultureListObj.perforList.filter(item => item.realmName === genre || item.title.match("전시"));
        //item.PERIOD.match("2024-07-01") || item.PERIOD.match("2024-07")
        console.log("item length : "+items.length);
        const filteredList = items.filter(item => (item.PERIOD).includes("2024-07"));
        console.log("2024년 7월 : "+JSON.stringify(filteredList));
        // items.forEach(item => {
        //   console.log("TITLE:", item.TITLE);
        //   console.log("CNTC_INSTT_NM:", item.CNTC_INSTT_NM);
        //   console.log("COLLECTED_DATE:", item.COLLECTED_DATE);
        //   console.log("DESCRIPTION:", item.DESCRIPTION);
        //   console.log("IMAGE_OBJECT:", item.IMAGE_OBJECT);
        //   console.log("URL:", item.URL);
        //   console.log("EVENT_PERIOD:", item.EVENT_PERIOD);
        //   console.log("\n");
        // });
      } else {
        console.error("아이템 데이터를 찾을 수 없습니다.");
      }


} else {
        // 오류 처리
        console.error('Network response was not ok ' + xhr.statusText);
      }

}
xhr.send('');

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
