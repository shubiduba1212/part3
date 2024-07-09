export default function CultureInfoApi({ setData }) {
  var xhr = new XMLHttpRequest();
var url = 'newapi/openapi/API_CCA_145/request'; /*URL*/
// var url = '/newapi/openapi/API_CCA_145/request'; /*URL*/
var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'fd506ee2-a511-45ff-97b2-3d6d8ea4482a'; /*서비스키*/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /*세션당 요청레코드수*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*페이지수*/

xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        console.log('status: ' + this.status);

        var parser = new DOMParser();
        var xmlDoc = parser.parseFromString(this.responseText, "text/xml");
        console.log(xmlDoc);
        console.log('resultCode: ' + xmlDoc.getElementsByTagName('resultCode')[0]);
        console.log('resultMsg: ' + xmlDoc.getElementsByTagName('resultMsg')[0]);

        var items = xmlDoc.getElementsByTagName('item');
        Array.prototype.forEach.call(items, function(item) {
            console.log("TITLE: " + item.getElementsByTagName("TITLE")[0].textContent);
            console.log("CNTC_INSTT_NM: " + item.getElementsByTagName("CNTC_INSTT_NM")[0].textContent);
            console.log("COLLECTED_DATE: " + item.getElementsByTagName("COLLECTED_DATE")[0].textContent);
            console.log("ISSUED_DATE: " + item.getElementsByTagName("ISSUED_DATE")[0].textContent);
            console.log("DESCRIPTION: " + item.getElementsByTagName("DESCRIPTION")[0].textContent);
            console.log("IMAGE_OBJECT: " + item.getElementsByTagName("IMAGE_OBJECT")[0].textContent);
            console.log("LOCAL_ID: " + item.getElementsByTagName("LOCAL_ID")[0].textContent);
            console.log("URL: " + item.getElementsByTagName("URL")[0].textContent);
            console.log("VIEW_COUNT: " + item.getElementsByTagName("VIEW_COUNT")[0].textContent);
            console.log("SUB_DESCRIPTION: " + item.getElementsByTagName("SUB_DESCRIPTION")[0].textContent);
            console.log("SPATIAL_COVERAGE: " + item.getElementsByTagName("SPATIAL_COVERAGE")[0].textContent);
            console.log("EVENT_SITE: " + item.getElementsByTagName("EVENT_SITE")[0].textContent);
            console.log("GENRE: " + item.getElementsByTagName("GENRE")[0].textContent);
            console.log("DURATION: " + item.getElementsByTagName("DURATION")[0].textContent);
            console.log("NUMBER_PAGES: " + item.getElementsByTagName("NUMBER_PAGES")[0].textContent);
            console.log("TABLE_OF_CONTENTS: " + item.getElementsByTagName("TABLE_OF_CONTENTS")[0].textContent);
            console.log("AUTHOR: " + item.getElementsByTagName("AUTHOR")[0].textContent);
            console.log("CONTACT_POINT: " + item.getElementsByTagName("CONTACT_POINT")[0].textContent);
            console.log("ACTOR: " + item.getElementsByTagName("ACTOR")[0].textContent);
            console.log("CONTRIBUTOR: " + item.getElementsByTagName("CONTRIBUTOR")[0].textContent);
            console.log("AUDIENCE: " + item.getElementsByTagName("AUDIENCE")[0].textContent);
            console.log("CHARGE: " + item.getElementsByTagName("CHARGE")[0].textContent);
            console.log("PERIOD: " + item.getElementsByTagName("PERIOD")[0].textContent);
            console.log("EVENT_PERIOD: " + item.getElementsByTagName("EVENT_PERIOD")[0].textContent);
        });
    }
};
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

}
