# Normalization

All relations must be normalized up to BCNF. You must explain why you believe every relation in your database in normalized.

Customers (<u>CustomerID</u>, Membership, FirstName, LastName, Gender, BirthDate, Phone Number, Email, Address)

- This relation appears to be in BCNF. Each attribute is functionally dependent on the primary key (CustomerID). There are no non-trivial dependencies or partial dependencies.

Packages (<u>PackageID</u>, Fee, NumberOfHikesPerYear)

- This relation is also in BCNF. The attributes are fully dependent on the primary key (PackageID), and there are no non-trivial dependencies or partial dependencies.

Employees (<u>SIN</u>, FirstName, LastName, Expertise)

- This relation is in BCNF. The attributes are fully dependent on the primary key (SIN), and there are no non-trivial dependencies or partial dependencies.

Places (<u>Address</u>, Elevation, Hardness, Hours)

- This relation is in BCNF. The attributes are fully dependent on the primary key (Address), and there are no non-trivial dependencies or partial dependencies.

Events (<u>EventID</u>, Date, Time, Duration, RequiredEquipment, **Address**)

- This relation is in BCNF. The attributes are fully dependent on the primary key (EventID), and there are no non-trivial dependencies or partial dependencies.

Packages_Events (<u>**PackageID**</u>, <u>**EventID**</u>)

- This relation is in BCNF. The attributes are both part of the primary key and there are no non-trivial dependencies or partial dependencies.

Employees_Events ((<u>**SIN**</u>, <u>**EventID**</u>), Role)

- This relation is in BCNF. The attributes are all part of the primary key, and there are no non-trivial dependencies or partial dependencies.

Customers_Events (<u>**CustomerID**</u>, <u>**EventID**</u>)

- This relation is in BCNF. The attributes are both part of the primary key, and there are no non-trivial dependencies or partial dependencies.

Events_Photos (<u>**EventID**</u>, <u>PhotoID</u>)

- This relation is in BCNF. The attributes are both part of the primary key, and there are no non-trivial dependencies or partial dependencies.

Share_Photos ((<u>**EventID**</u>, <u>**PhotoID**</u>), **CustomerID**)

- Since EventID -> CustomerID also holds, it can be decomposed into 2NF.

  - Share_Photos (<u>EventID</u>, <u>PhotoID</u>)

  - Share_Customers(EventID, CustomerID)

- All of these two relations have existed, so that we do not store them again.

Employee_Photos ((<u>**EventID**</u>, <u>**PhotoID**</u>), **AuthorSIN**)

- This relation is in BCNF. The attributes are all part of the primary key, and there are no non-trivial dependencies or partial dependencies.

Customer_Photos ((<u>**EventID**</u>, <u>**PhotoID**</u>), **AuthorID**)

- This relation is in BCNF. The attributes are all part of the primary key, and there are no non-trivial dependencies or partial dependencies.

Payments (<u>TransactionID</u>, Date, FullAmount, **CustomerID**, **PackageID**)

- The payment type should be added to classify the type of payments

Full_Payments (<u>**TransactionID**</u>, PaymentStatus)

- This relation is in BCNF. The attributes are all dependent on the primary key (TransactionID), and there are no non-trivial dependencies or partial dependencies.

Installment_Payments (<u>**TransactionID**</u>, InstallmentNumber, InstallmentAmount, InstallmentStatus)

- This relation is in BCNF. The attributes are all dependent on the primary key (TransactionID), and there are no non-trivial dependencies or partial dependencies.

## Final Relational Schema

**The finalize relations are as follows:**

Customers (<u>CustomerID</u>, Membership, FirstName, LastName, Gender, BirthDate, Phone Number, Email, Address)

Packages (<u>PackageID</u>, Fee, NumberOfHikesPerYear)

Employees (<u>SIN</u>, FirstName, LastName, Expertise)

Hiking_Places (<u>Address</u>, Elevation, Hardness, Hours)

Hiking_Events (<u>EventID</u>, EventDate, EventTime, Duration, RequiredEquipment, Address)

Packages_Events (<u>**PackageID**</u>, <u>**EventID**</u>)

Employees_Events ((<u>**SIN**</u>, <u>**EventID**</u>), Role)

Customers_Events (<u>**CustomerID**</u>, <u>**EventID**</u>)

Events_Photos (<u>**EventID**</u>, <u>PhotoID</u>)

Employee_Photos ((<u>**EventID**</u>, <u>**PhotoID**</u>), **AuthorSIN**)

Customer_Photos ((<u>**EventID**</u>, <u>**PhotoID**</u>), **AuthorID**)

Payments (<u>TransactionID</u>, Date, FullAmount,PaymentType, **CustomerID**, **PackageID**)

Full_Payments (<u>**TransactionID**</u>, PaymentStatus)

Installment_Payments (<u>**TransactionID**</u>, InstallmentNumber, InstallmentAmount, InstallmentStatus)
