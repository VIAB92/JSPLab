<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage='errorPage.jsp' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculator</title>
    </head>
    <script>
        function checkForm()
        {
            if (f1.operand1.value=="" || f1.operand2.value=="")
            {
                alert("Отсутствует оператор!");
                return false;
            }
            
            return true;
        }
        function Go(operation)
        {
            frm = document.f1;
            frm.operation.value=operation;
            frm.submit();
        }
    </script>
    <body>
        <h1 align='center'>Calculator v 1.0</h1>
        <% double result = 0;
        String op;
        float value1, value2;
            if (request.getParameter("operation")!=null)
            {
                op = request.getParameter("operation");
                value1 = Float.parseFloat(request.getParameter("operand1"));
                value2 = Float.parseFloat(request.getParameter("operand2"));
                if (op.equals("+")) result = value1+value2;
                else if (op.equals("-")) result = value1-value2;
                else if (op.equals("*")) result = value1*value2;
                else if(op.equals("/"))
                {
                   if (value2==0) throw new Exception("Division by zero");
                   result=value1/value2;
                }
                
            }
            else
            {
                value1=0; value2=0;
            }
        %>
        <form action='calculator.jsp' method="get" onsubmit="checkForm()" name='f1'>
            <input type='hidden' name="operation" id='operation'/>
        <table align='center' border='1'>
            <tr>
                <td align='center'>Операнд 1:</td>
                <td align='center'><input type='text' value='<%=value1%>' id='operand1' name='operand1'/></td>
                <td align='center'>Операнд 2:</td>
                <td align='center'><input type='text' value='<%=value2%>' id='operand2' name='operand2'/></td>
            </tr>
            <tr>
                <td colspan="2" align='center'>
                    <input type='button' value='+' name='btnPlus' onclick='Go("+")'/>
                </td>
                <td colspan="2" align='center'>
                    <input type='button' value='-' name='btnMinus' onclick='Go("-")'/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align='center'>
                    <input type='button' value='*' name='btnMul' onclick='Go("*")'/>
                </td>
                <td colspan="2" align='center'>
                    <input type='button' value='/' name='btnDivide' onclick='javascript: Go("/")'/>
                </td>
            </tr>
            <tr>
                <td colspan="4" align='center'>
                    <p>Result = <%=result%></p>
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>
