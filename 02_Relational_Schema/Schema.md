# Relational Schema

The relational Schema is written here:

Customers (<u>CustomerID</u>, Membership, FirstName, LastName, Gender, BirthDate, Phone Number, Email, Address)

Packages (<u>PackageID</u>, Fee, NumberOfHikesPerYear)

Employees (<u>SIN</u>, FirstName, LastName, Expertise)

Places (<u>Address</u>, Elevation, Hardness, Hours)

Events (<u>EventID</u>, Date, Time, Duration, RequiredEquipment, **Address**)

Packages_Events (<u>**PackageID**</u>, <u>**EventID**</u>)

Employees_Events ((<u>**SIN**</u>, <u>**EventID**</u>), Role)

Customers_Events (<u>**CustomerID**</u>, <u>**EventID**</u>)

Events_Photos (<u>**EventID**</u>, <u>PhotoID</u>)

Share_Photos ((<u>**EventID**</u>, <u>**PhotoID**</u>), **CustomerID**)

Employee_Photos ((<u>**EventID**</u>, <u>**PhotoID**</u>), **AuthorSIN**)

Customer_Photos ((<u>**EventID**</u>, <u>**PhotoID**</u>), **AuthorID**)

Payments (<u>TransactionID</u>, Date, FullAmount, **CustomerID**, **PackageID**)

Full_Payments (<u>**TransactionID**</u>, PaymentStatus)

Installment_Payments (<u>**TransactionID**</u>, InstallmentNumber, InstallmentAmount, InstallmentStatus)
