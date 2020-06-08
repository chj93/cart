<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          <c:forEach var="i" items="${chartList}" varStatus="cnt">
          	['${i.productName}',${i.productPrice}]
          	<c:choose>
          		<c:when test="${cnt.count ne functions:length(chartList)}">
          		,
          		</c:when>
          	</c:choose>          	
          </c:forEach>
   
        ]);

        var options = {
          title:' ${title}'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }