<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AcademicUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        \DB::table('users')->truncate();
        // --- الحساب الحقيقي للاختبار ---
        User::create([
            'first_name' => 'أحمد',
            'last_name' => 'الخضر',
            'email' => 'ahmadalkhder2002g.2@gmail.com', // بريدك الإلكتروني
            'password' => Hash::make('password'), // كلمة مرور افتراضية
            'role' => 'academic',
            'status' => (bool) 1, // Explicitly cast to boolean
        ]);

        // حسابات أكاديمية وهمية إضافية
        User::create([
            'first_name' => 'فاطمة',
            'last_name' => 'علي',
            'email' => 'fatima.ali@example.com',
            'password' => Hash::make('password'),
            'role' => 'academic',
            'status' => (bool) 1, // Explicitly cast to boolean
        ]);

        User::create([
            'first_name' => 'يوسف',
            'last_name' => 'محمود',
            'email' => 'youssef.mahmoud@example.com',
            'password' => Hash::make('password'),
            'role' => 'academic',
            'status' => (bool) 1, // Explicitly cast to boolean
        ]);
    }
}
