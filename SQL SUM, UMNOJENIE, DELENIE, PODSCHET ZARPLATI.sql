DECLARE @a INT = 34;
DECLARE @b INT = 4;
DECLARE @c INT;


SET @c = @a+@b;
PRINT(@c)

SET @c = @a*@b;
PRINT(@c)

SET @c = @a/@b;
PRINT(@c)



DECLARE @results TABLE ([Date] DATE , AddMoney MONEY , Salary MONEY  )
DECLARE @startDate DATE = GETDATE();--'2023-07-16'
DECLARE @startMoney MONEY = 1000;
DECLARE @months INT = 12;
DECLARE @percent FLOAT = 3.2;
DECLARE @addMoney Money = 0;

WHILE @months > 0
    BEGIN
        SET @startDate = DATEADD(MONTH,1,@startDate);
        INSERT INTO @results VALUES(@startDate,@addMoney,@startMoney)
		SET @addMoney = (@startMoney / 100 ) * @percent;
		SET @startMoney = @startMoney + @addMoney
	    SET @months = @months - 1;
    END

SELECT * FROM @results