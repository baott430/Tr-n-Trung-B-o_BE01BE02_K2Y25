using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.IO;

public class ConsoleApp
{
    public static void Run()
    {
        var configuration = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json")
            .Build();

        var serviceProvider = new ServiceCollection()
            .AddDbContext<AppDbContext>(options =>
                options.UseNpgsql(configuration.GetConnectionString("DefaultConnection")))
            .BuildServiceProvider();

        using var context = serviceProvider.GetRequiredService<AppDbContext>();

        Console.WriteLine("== THỐNG KÊ THEO DỊCH VỤ (THEO NĂM/THÁNG/TUẦN) ==");
        foreach (var item in context.ViewAssignmentsPeriod)
        {
            Console.WriteLine($"{item.ServiceCode} - {item.ServiceName}: Năm {item.Yearly}, Tháng {item.Monthly}, Tuần {item.Weekly}");
        }

        Console.WriteLine("\n== TRẠNG THÁI SỬ DỤNG ==");
        foreach (var item in context.ViewAssignmentStatus)
        {
            Console.WriteLine($"Status {(item.Status == 1 ? "Đã dùng" : "Chưa dùng")}: {item.Total}");
        }

        Console.WriteLine("\n== PHÂN CÔNG THEO THIẾT BỊ ==");
        foreach (var item in context.ViewAssignmentsByDevice)
        {
            Console.WriteLine($"{item.DeviceCode}: {item.TotalAssignments} lượt");
        }
    }
}
