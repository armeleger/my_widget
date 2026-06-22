import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Number Input',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const PhoneInputPage(),
    );
  }
}

class Country {
  final String name;
  final String flag;
  final String dialCode;
  const Country(this.name, this.flag, this.dialCode);
}

class PhoneInputPage extends StatefulWidget {
  const PhoneInputPage({super.key});

  @override
  State<PhoneInputPage> createState() => _PhoneInputPageState();
}

class _PhoneInputPageState extends State<PhoneInputPage> {
  final List<Country> _countries = const [
    Country('Rwanda', '🇷🇼', '+250'),
    Country('Kenya', '🇰🇪', '+254'),
    Country('Uganda', '🇺🇬', '+256'),
    Country('Tanzania', '🇹🇿', '+255'),
    Country('Nigeria', '🇳🇬', '+234'),
    Country('South Africa', '🇿🇦', '+27'),
    Country('United States', '🇺🇸', '+1'),
    Country('United Kingdom', '🇬🇧', '+44'),
    Country('France', '🇫🇷', '+33'),
    Country('Germany', '🇩🇪', '+49'),
    Country('India', '🇮🇳', '+91'),
    Country('China', '🇨🇳', '+86'),
    Country('Japan', '🇯🇵', '+81'),
    Country('Brazil', '🇧🇷', '+55'),
    Country('UAE', '🇦🇪', '+971'),
  ];


  late Country _selected = _countries.first;  //Selected
  String _number = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone Number Input')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter your phone number',
                style: TextStyle(fontSize: 18)),
            const SizedBox(height: 16),

            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<Country>(
                    value: _selected,                      //the dropdown shows whatever's in my state
                    underline: const SizedBox(),
                    items: _countries.map((country) {
                      return DropdownMenuItem<Country>(
                        value: country,
                        child: Text('${country.flag} ${country.dialCode}'),
                      );
                    }).toList(),
                    onChanged: (Country? newCountry) {   //onChanged
                      if (newCountry == null) return;
                      setState(() => _selected = newCountry);  //when you pick, I update my state, which triggers the redraw
                    },
                  ),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: 'Phone number',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => _number = value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            Text('Full number:',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
            const SizedBox(height: 8),
            Text(
              '${_selected.dialCode} ${_number.isEmpty ? '...' : _number}',
              style:
              const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Country: ${_selected.name}',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}