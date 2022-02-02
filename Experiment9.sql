--1)	Write a PL/SQL code to accept the value of A, B & C display which is greater.
	BEGIN
     DECLARE @A INTEGER;
	 SET @A =15;
	 DECLARE @B INTEGER;
	 SET @B = 65;  
     DECLARE @C INTEGER; 
	 SET @C =25;
  	IF @A>@B AND @A>@C
	PRINT 'GREATEST IS A';
	ELSE IF @B>@C AND @B>@C 
	PRINT 'GREATEST IS B';
	ELSE
	PRINT 'GREATEST IS C';
	END;

	--2)	Using PL/SQL Statements create a simple loop that display message “Welcome to PL/SQL Programming” 20 times
	
	 DECLARE @i integer;
	 set @i=1;
	 while @i<=20
	 BEGIN 
	 PRINT 'Welcome to PL/SQL Programming';
	 set @i=@i+1;
	 END
	 go
	-- 3)	Write a PL/SQL code block to find the factorial of a number.
	DECLARE @fact integer, @n integer;
	set @fact=1;
	set @n=6;
	while @n > 0 
	begin
    set @fact=@n*@fact         
    set @n=@n-1  
	end
	print @fact 

	go

	--4)	Write a PL/SQL program to generate Fibonacci series.
	   declare @f1 INTEGER=0, @f2 INTEGER=1,@f3 INTEGER,@i INTEGER=3,@len INTEGER;
   print 'First two number'
   print @f1;
   print @f2;
   set @len=10;
   print 'fibonacci series is';
   while(@i<=@len)
   begin
        set @f3=@f1+@f2;  
		print @f3    
        set @f1=@f2;
        set @f2=@f3;
        set @i=@i+1;    
		end;
		GO
    --5)	Write a PL/SQL code to fund the sum of first N numbers
declare @n integer, @i integer, @sum integer = 0;
  set @i = 1;
  set @n=10;
    while (@i <= @n) 
	begin
        set @sum=@sum+@i 
        set @i=@i+1
	end
	print 'sum of first N=10 numbers'
	print @sum
