CREATE DEFINER=`root`@`localhost` FUNCTION `F_1`(rmse double) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
declare result text;

	if rmse < 18  then
		set result="Best";
	elseif rmse < 19 then 
		set result="Moderate";
	else
		set result="Worst";
	end if;

RETURN (result);
END

CREATE DEFINER=`root`@`localhost` FUNCTION `F_2`(mae double) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
declare result text;

	if mae > 18  then
		set result="Worst";
	else
		set result="Best ";
	end if;

RETURN (result);
END

CREATE DEFINER=`root`@`localhost` FUNCTION `F_3`(mse double) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
declare result text;

	if mse < 300  then
		set result="Best";
	elseif mse <500 then 
		set result="Moderate";
	else
		set result="Worst";
	end if;

RETURN (result);
END

CREATE DEFINER=`root`@`localhost` FUNCTION `F_4`(relative_importance double) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
declare result text;

	if relative_importance < 10000  then
		set result="not important";
	elseif relative_importance >10000 and  relative_importance< 50000 then 
		set result="Moderately important ";
	else
		set result="very important";
	end if;

RETURN (result);
END

CREATE DEFINER=`root`@`localhost` FUNCTION `F_5`(scaled_importance double) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
declare result text;

	if scaled_importance <0.02  then
		set result="not important";
	elseif scaled_importance >0.02 and  scaled_importance<0.05  then 
		set result="Moderately important ";
	else
		set result="very important";
	end if;

RETURN (result);
END

CREATE DEFINER=`root`@`localhost` FUNCTION `F_6`(ntrees int) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
declare result text;

	if ntrees >100  then
		set result="Very accurate";
	
	else
		set result="Moderately accurate";
	end if;

RETURN (result);
END