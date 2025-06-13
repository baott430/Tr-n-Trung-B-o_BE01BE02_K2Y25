
            INSERT INTO Devices (DeviceCode, DeviceName, IpAddress, UserName, Password, Connected, OperationStatus) VALUES
            ('KIO_01', 'KIOS 01', '192.168.1.1', 'admin01', 'pass01', true, true),
            ('KIO_02', 'KIOS 02', '192.168.1.2', 'admin02', 'pass02', true, false),
            ('KIO_03', 'KIOS 03', '192.168.1.3', 'admin03', 'pass03', false, false),
            ('KIO_04', 'KIOS 04', '192.168.1.4', 'admin04', 'pass04', true, true),
            ('KIO_05', 'KIOS 05', '192.168.1.5', 'admin05', 'pass05', true, true),
            ('KIO_06', 'KIOS 06', '192.168.1.6', 'admin06', 'pass06', false, true);

            INSERT INTO Services (ServiceCode, ServiceName, Description, IsInOperation) VALUES
            ('201', 'Khám tim mạch', 'Khám bệnh liên quan đến tim', true),
            ('202', 'Khám phụ khoa', 'Dành cho nữ giới', true),
            ('203', 'Khám tai mũi họng', 'Liên quan đến TMH', false),
            ('204', 'Khám răng hàm mặt', 'Khám nha khoa', true);
  INSERT INTO Assignments (Code, CustomerName, CustomerEmail, Telephone, AssignmentDate, ExpireDate, Status, ServiceCode, DeviceCode) VALUES
            ('A001', 'Nguyễn Văn A', 'a@gmail.com', '0901234567', TIMESTAMP '2025-06-01 08:00:00+07', TIMESTAMP '2025-06-01 09:00:00+07', 1, '201', 'KIO_01'),
            ('A002', 'Trần Thị B', 'b@gmail.com', '0902234567', TIMESTAMP '2025-06-10 10:00:00+07', TIMESTAMP '2025-06-10 11:00:00+07', 0, '202', 'KIO_02'),
            ('A003', 'Lê Văn C', 'c@gmail.com', '0903234567', TIMESTAMP '2025-06-12 14:00:00+07', TIMESTAMP '2025-06-12 15:00:00+07', 1, '203', 'KIO_03'),
            ('A004', 'Phạm Thị D', 'd@gmail.com', '0904234567', TIMESTAMP '2025-06-13 09:00:00+07', TIMESTAMP '2025-06-13 10:00:00+07', 0, '204', 'KIO_04'),
            ('A005', 'Đặng Văn E', 'e@gmail.com', '0905234567', TIMESTAMP '2025-06-14 13:00:00+07', TIMESTAMP '2025-06-14 14:00:00+07', 1, '201', 'KIO_05'),
            ('A006', 'Bùi Thị F', 'f@gmail.com', '0906234567', TIMESTAMP '2025-06-15 15:00:00+07', TIMESTAMP '2025-06-15 16:00:00+07', 0, '202', 'KIO_06'),
            ('A007', 'Hoàng Văn G', 'g@gmail.com', '0907234567', TIMESTAMP '2025-06-15 16:00:00+07', TIMESTAMP '2025-06-15 17:00:00+07', 1, '204', 'KIO_01'),
            ('A008', 'Mai Thị H', 'h@gmail.com', '0908234567', TIMESTAMP '2025-06-15 17:00:00+07', TIMESTAMP '2025-06-15 18:00:00+07', 0, '203', 'KIO_02');
            
            REFRESH MATERIALIZED VIEW View_Assignments_Period;
            REFRESH MATERIALIZED VIEW View_Assignment_Status;
            REFRESH MATERIALIZED VIEW View_Assignments_By_Device;
            SELECT * FROM View_Assignments_Period;

