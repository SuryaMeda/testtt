USE [ProjectASP]
GO
/****** Object:  StoredProcedure [dbo].[insert_reg]    Script Date: 31-03-2018 12:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[insert_reg](@name varchar(20),@dob date,@phone bigint,@country varchar(10),@state varchar(10),@district varchar(10),@city varchar(10),@email varchar(30),@pwd varchar(20),@Cpwd varchar(20),@gender varchar(10),@lang varchar(10),@addres varchar(100),@blood varchar(10),@photo varchar(100),@bloodgroup varchar(10))
as begin
declare @id int,@bno varchar(10)
set @id=(select ISNULL(MAX(id),0)+1 from Registation)
set @bno='blood'+RIGHT('_',5)+CAST(@id as varchar(10))

insert into Registation values(@name,@dob,@phone,@country,isnull(@state,''),isnull(@district,''),isnull(@city,''),@email,@pwd,@Cpwd,@gender,@lang,@addres,@blood,@photo,@bno,@bloodgroup )
end

update Registation set bloodGroup='O+' where bno='blood_1'




select * from Aqua_Accounts_Master
select * from Aqua_Accounts_Group_Master
select * from Aqua_Account_Head_Master
select * from Aqua_Accounts_Sub_Group_Master
select * from temp_Acc_Subgroup_ledger_Master
select * from temp_Acc_SSGroup_SLedger_Master
select * from temp_Acc_SSledger_Master





select * from Cold_Storage_Master
select * from CS_Storage_Details
select * from CS_Rack_Details
select * from Cold_Storage_CTE


CREATE procedure [jme].[SP_Rep_Cold_Storage_All]

as begin

WITH Cold_Storage_CTE (Cold_Storage_No, No_Of_Pellets)

AS

(

SELECT csm.Cold_Storage_No,sum(crd.CS_No_Of_Pellets) as No_Of_Pellets from

Cold_Storage_Master csm inner join CS_Rack_Details crd on csm.Cold_Storage_No=crd.Cold_Storage_No 

inner join CS_Storage_Details csd on csm.Cold_Storage_No=csd.Cold_Storage_No  AND csd.CS_Row_No=crd.CS_Row_No AND  csd.CS_Rack_No=crd.CS_Rack_No

group by csm.Cold_Storage_No

)

select RIGHT(csm.Cold_Storage_No,LEN(csm.Cold_Storage_No)-3) AS Cold_Storage_NO,RIGHT(crd.CS_Row_No,LEN(crd.CS_Row_No)-4) AS


CS_ROW_NO,crd.CS_Rack_Numbers,crd.CS_No_Of_Pellets,crd.CS_Rack_Rare_Y_N,crd.CS_No_Of_Levels_Rack,

crd.CS_No_of_Parts_Rack,crd.CS_No_of_Pellets_Section,csd.CS_Stock_No,csd.CS_Barcode_No

from

Cold_Storage_Master csm inner join CS_Rack_Details crd on csm.Cold_Storage_No=crd.Cold_Storage_No 

inner join CS_Storage_Details csd on csm.Cold_Storage_No=csd.Cold_Storage_No  AND csd.CS_Row_No=crd.CS_Row_No AND  csd.CS_Rack_No=crd.CS_Rack_No

inner join Cold_Storage_CTE cte on  csm.Cold_Storage_No=cte.Cold_Storage_No 

order by csm.Cold_Storage_No,crd.CS_Row_No

end

select Cold_Storage_No as CS1,Cold_Storage_No as CS2 from Cold_Storage_Master where Cold_Storage_No in(STRING_SPLIT(CS_, ','))

SELECT PARSENAME(REPLACE(Cold_Storage_No,'_','.'),2) as CS1, 
       PARSENAME(REPLACE(Cold_Storage_No,'_','.'),1) as CS2
    FROM Cold_Storage_Master order by cs2 desc 

 SELECT FirstName, LastName
      FROM Employees
      WHERE EmployeeId IN(
            SELECT CAST(Item AS INTEGER)
            FROM dbo.SplitString(@EmployeeIds, ',')
      )