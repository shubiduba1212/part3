var xhr = new XMLHttpRequest();
  var url = '/newapi/openapi/API_CCA_145/request'; /*URL*/
  var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'fd506ee2-a511-45ff-97b2-3d6d8ea4482a'; /*서비스키*/
  queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('5000'); /*세션당 요청레코드수*/
  queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*페이지수*/

  xhr.open('GET', url + queryParams);
  xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
      console.log('status: ' + this.status);
      if (xhr.status >= 200 && xhr.status < 300) {
        var parser = new DOMParser();// XML 문자열을 파싱하기 위해 DOMParser 객체를 생성
        var xmlDoc = parser.parseFromString(this.responseText, "application/xml"); // XML 문자열을 XML DOM 객체로 변환
        const jsonData = xmlToJson(xmlDoc); // XML 데이터를 JSON 형식으로 변환
        // console.log('resultCode: ' + xmlDoc.getElementsByTagName('resultCode')[0].textContent);
        // console.log('resultMsg: ' + xmlDoc.getElementsByTagName('resultMsg')[0].textContent);
        console.log("jsonData from kcisa 전시통합 정보 : ", jsonData);
        // console.log("jsonData from kcisa 전시통합 정보 : ", jsonData.response.body[0].items[0].item);
        // setData(jsonData.response.msgBody[0]); // App.js에서 전달받은 setData 함수를 호출하여 데이터 설정
        // console.log("from CultureApi : "+jsonData.response.msgBody[0]);
        // var itemJsonData = jsonData.response.body[0].items[0].item; // 전시 정보만 담기

        // const filteredList = itemJsonData.filter(item => (item.PERIOD).includes("2024-07") || (item.PERIOD).includes("~2024-08") || (item.PERIOD).includes("~2024-07-19"));
        // console.log("filteredList : ", filteredList);

        // var items = xmlDoc.getElementsByTagName('item');
        // Array.prototype.forEach.call(items, function (item) {
    //     filteredList.forEach(item => {
    //       console.log("TITLE: ",item.TITLE);
    //       console.log("CNTC_INSTT_NM: ", item.CNTC_INSTT_NM);
    //       console.log("DESCRIPTION: ", item.DESCRIPTION);
    //       console.log("IMAGE_OBJECT: ", item.IMAGE_OBJECT);
    //       console.log("LOCAL_ID: ", item.LOCAL_ID);
    //       console.log("URL: ", item.URL);
    //       console.log("VIEW_COUNT: ", item.VIEW_COUNT);
    //       console.log("SUB_DESCRIPTION: ", item.SUB_DESCRIPTION);
    //       console.log("SPATIAL_COVERAGE: ", item.SPATIAL_COVERAGE);
    //       console.log("EVENT_SITE: ", item.EVENT_SITE);
    //       console.log("GENRE: ", item.GENRE);
    //       console.log("DURATION: ", item.DURATION); // 관람시간
    //       console.log("AUTHOR: ", item.AUTHOR);
    //       console.log("CONTACT_POINT: ", item.CONTACT_POINT);
    //       console.log("ACTOR: ", item.ACTOR);
    //       console.log("CONTRIBUTOR: ", item.CONTRIBUTOR);
    //       console.log("AUDIENCE: ", item.AUDIENCE);
    //       console.log("CHARGE: ", item.CHARGE);
    //       console.log("PERIOD: ", item.PERIOD); // 기간
    //       console.log("EVENT_PERIOD: ", item.EVENT_PERIOD); // 시간
    //     });
    //   } else {
    //     // 오류 처리
    //     console.error('Network response was not ok ' + xhr.statusText);
      }
    }

var xhr2 = new XMLHttpRequest();
  var url2 = '/newapi/openapi/API_CCA_144/request'; /*URL*/
  // var url = 'http://api.kcisa.kr/openapi/API_CCA_145/request'; /*URL*/
  var queryParams2 = '?' + encodeURIComponent('serviceKey') + '=' + '9b59a1f4-e64b-4321-85ee-485aac5b03d7'; /*서비스키*/
  // var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'fd506ee2-a511-45ff-97b2-3d6d8ea4482a'; /*서비스키*/
  queryParams2 += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('50000'); /*세션당 요청레코드수*/
  queryParams2 += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*페이지수*/

  xhr2.open('GET', url2 + queryParams2);
  xhr2.onreadystatechange = function () {
    if (this.readyState == 4) {
      console.log('status: ' + this.status);
      if (xhr2.status >= 200 && xhr2.status < 300) {
        var parser = new DOMParser();// XML 문자열을 파싱하기 위해 DOMParser 객체를 생성
        var xmlDoc = parser.parseFromString(this.responseText, "application/xml"); // XML 문자열을 XML DOM 객체로 변환
        // var jsonDoc = (this.responseText, "application/json"); // XML 문자열을 XML DOM 객체로 변환
        const jsonData = xmlToJson(xmlDoc); // XML 데이터를 JSON 형식으로 변환
        // console.log('resultCode: ' + xmlDoc.getElementsByTagName('resultCode')[0].textContent);
        // console.log('resultMsg: ' + xmlDoc.getElementsByTagName('resultMsg')[0].textContent);
        console.log("jsonData from 문화체육관광부_문화예술공연(통합) : ", jsonData);
        // console.log("jsonData from 문화체육관광부_문화예술공연(통합) : ", jsonDoc);
        // console.log("jsonData from kcisa 전시통합 정보 : ", jsonData.response.body[0].items[0].item);
        // setData(jsonData.response.msgBody[0]); // App.js에서 전달받은 setData 함수를 호출하여 데이터 설정
        // console.log("from CultureApi : "+jsonData.response.msgBody[0]);
        var itemJsonData = jsonData.response.body[0].items[0].item; // 전시 정보만 담기

        const filteredList = itemJsonData.filter(item => (item.PERIOD).includes("2024-07") || (item.PERIOD).includes("~2024-08") || (item.PERIOD).includes("~2024-07-19"))
        console.log("filteredList : ", filteredList);

        // var items = xmlDoc.getElementsByTagName('item');
        // Array.prototype.forEach.call(items, function (item) {
        filteredList.forEach(item => {
          console.log("TITLE: ",item.TITLE);
          console.log("CNTC_INSTT_NM: ", item.CNTC_INSTT_NM);
          console.log("DESCRIPTION: ", item.DESCRIPTION);
          console.log("IMAGE_OBJECT: ", item.IMAGE_OBJECT);
          console.log("LOCAL_ID: ", item.LOCAL_ID);
          console.log("URL: ", item.URL);
          console.log("VIEW_COUNT: ", item.VIEW_COUNT);
          console.log("SUB_DESCRIPTION: ", item.SUB_DESCRIPTION);
          console.log("SPATIAL_COVERAGE: ", item.SPATIAL_COVERAGE);
          console.log("EVENT_SITE: ", item.EVENT_SITE);
          console.log("GENRE: ", item.GENRE);
          console.log("DURATION: ", item.DURATION); // 관람시간
          console.log("AUTHOR: ", item.AUTHOR);
          console.log("CONTACT_POINT: ", item.CONTACT_POINT);
          console.log("ACTOR: ", item.ACTOR);
          console.log("CONTRIBUTOR: ", item.CONTRIBUTOR);
          console.log("AUDIENCE: ", item.AUDIENCE);
          console.log("CHARGE: ", item.CHARGE);
          console.log("PERIOD: ", item.PERIOD); // 기간
          console.log("EVENT_PERIOD: ", item.EVENT_PERIOD); // 시간
        });
      } else {
        // 오류 처리
        console.error('Network response was not ok ' + xhr2.statusText);
      }
    }
  };
  xhr2.send('');
