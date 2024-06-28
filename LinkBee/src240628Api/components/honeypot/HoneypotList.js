import "./HoneypotList.css";
import { useState } from "react";

function HoneypotList( {honeypotData, currentPage, setCurrentPage, pageGroup, setPageGroup} ) {
  
  const honeypotsPerPage = 10;

  // 현재 페이지에 맞는 데이터 필터링
  const indexOfLastHoneypot = currentPage * honeypotsPerPage;
  const indexOfFirstHoneypot = indexOfLastHoneypot - honeypotsPerPage;
  const currentHoneypots = honeypotData.slice(
    indexOfFirstHoneypot,
    indexOfLastHoneypot
  );

  // 총 페이지 수 계산
  const totalPages = Math.ceil(honeypotData.length / honeypotsPerPage);
  const maxPageButtons = 5;
  const totalGroups = Math.ceil(totalPages / maxPageButtons);

  const startPage = pageGroup * maxPageButtons + 1;
  const endPage = Math.min(startPage + maxPageButtons - 1, totalPages);

  const handleCurrentPageGroupFirstPage = () => {
    const currentPageGroupStartPage = pageGroup * maxPageButtons + 1;
    setCurrentPage(currentPageGroupStartPage); // 현재 페이지 그룹의 첫 번째 페이지로 이동
  };

  const handleCurrentPageGroupLastPage = () => {
    const currentPageGroupStartPage = pageGroup * maxPageButtons + 1;
    const currentPageGroupEndPage = Math.min(currentPageGroupStartPage + maxPageButtons - 1, totalPages);
    setCurrentPage(currentPageGroupEndPage); // 현재 페이지 그룹의 마지막 페이지로 이동
  };

  const handlePrevPage = () => {
    if (currentPage > 1) {
      setCurrentPage(currentPage - 1);
      if (currentPage === startPage) {
        setPageGroup(pageGroup - 1);
      }
    } else if (pageGroup > 0) {
      setPageGroup(pageGroup - 1);
      setCurrentPage(endPage - maxPageButtons + 1); // 이전 페이지 그룹의 마지막 페이지로 이동
    }
  };

  const handleNextPage = () => {
    if (currentPage < totalPages) {
      setCurrentPage(currentPage + 1);
      if (currentPage === endPage) {
        setPageGroup(pageGroup + 1);
      }
    } else if (pageGroup < totalGroups - 1) {
      setPageGroup(pageGroup + 1);
      setCurrentPage(startPage + 1); // 다음 페이지 그룹의 첫 번째 페이지로 이동
    }
  };

  

  return (
    <div className="honeypot-list-container">
      {currentHoneypots.map((honeypot, index) => (
        <div key={index} className="one-honeypot-index">
          <div className="honeypot-index-poster">
            <img
              src={`${process.env.PUBLIC_URL}/images/honeypot/poster_test.jpg`}
              alt="포스터이미지"
            />
            <hr className="honeypot-dashed" />
          </div>
          <div className="honeypot-index-info">
            <div className="top-info">
              <div className="region-info">{honeypot.REGION}</div>
              <div className="category-info">{honeypot.INTEREST_CODE}</div>
              <div className="honeypot-status">{honeypot.CLOSURE_STATUS}</div>
            </div>
            <p className="honeypot-title">{honeypot.HONEYPOT_TITLE}</p>
            <div className="honeypot-schedule">
              <div>일정</div>
              <p className="honeypot-date">2024.06.02 (토)</p>
              <p className="total-member">
                참여인원 1 / {honeypot.TOTAL_MEMBER}
              </p>
            </div>
            <p className="end-date">{honeypot.END_DATE} 까지 모집해요</p>
          </div>
        </div>
      ))}
      <div className="pagination-container">
        <div className="pagination">
          <button className='first-btn' onClick={handleCurrentPageGroupFirstPage} disabled={currentPage === 1}>
            &lt;&lt;
          </button>
          <button className='prev-btn' onClick={handlePrevPage} disabled={currentPage === 1}>
            &lt;
          </button>
          {Array.from({ length: endPage - startPage + 1 }, (_, index) => (
            <button
              key={index}
              className={`page-button ${startPage + index === currentPage ? 'active' : ''}`}
              onClick={() => setCurrentPage(startPage + index)}
            >
              {startPage + index}
            </button>
          ))}
          <button className='next-btn' onClick={handleNextPage} disabled={currentPage === totalPages}>
            &gt;
          </button>
          <button className='last-btn' onClick={handleCurrentPageGroupLastPage} disabled={currentPage === totalPages}>
            &gt;&gt;
          </button>
        </div>
      </div>
    </div>
  );
}
export default HoneypotList;
