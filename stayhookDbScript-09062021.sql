CREATE TABLE IF NOT EXISTS `stayhookdb`.`Invoice` (
Id INT NOT NULL AUTO_INCREMENT
,InvoiceDate DATETIME
,TransactionId	Varchar(50)
,InvoiceType	Varchar(20)
,InvoiceStatus	Varchar(10)
,CustomerId	VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL
,Age int
,Amount	float(8,2)
,BalanceDue	float(8,2)
,ModeOfPayment	Varchar(50)
,BillToAddress	Varchar(200)
,ShipToAddress	Varchar(200)
,InvoiceDescription	Varchar(500)
,CreatedBy varchar(255)
,CreatedOn DATETIME
,MoifiedBy varchar(255)
,ModifiedOn datetime
,IsActive bool default 1
,PRIMARY KEY (`Id`),
  CONSTRAINT `FK_Invoice_CustomerId_AspNetUsers_UserId`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `stayhookdb`.`aspnetusers` (`Id`)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `stayhookdb`.`Image` (
Id INT NOT NULL AUTO_INCREMENT
,ImageName	Varchar(100)
,Location	varchar(250)
,ImageDescription	Varchar(500)
,IsActive bool default 1
,CreatedBy varchar(255)
,CreatedOn DATETIME
,MoifiedBy varchar(255)
,ModifiedOn datetime
,PRIMARY KEY (`Id`)
);

CREATE TABLE IF NOT EXISTS `stayhookdb`.`Booking` (
Id INT NOT NULL AUTO_INCREMENT
,CustomerId	VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL
,CustomerName	Varchar(200)
,HouseAddress	Varchar(500)
,BookingFor	Varchar(100)
,PaymentStatus	Varchar(20)
,Amount	Float(8,2)
,BookingAction	Varchar(100)
,BookingDescription	Varchar(500)
,CreatedBy varchar(255)
,CreatedOn DATETIME
,MoifiedBy varchar(255)
,ModifiedOn datetime
,IsActive bool default 1
,PRIMARY KEY (`Id`),
  CONSTRAINT `FK_Booking_CustomerId_AspNetUsers_UserId`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `stayhookdb`.`aspnetusers` (`Id`)
    ON DELETE CASCADE
);
