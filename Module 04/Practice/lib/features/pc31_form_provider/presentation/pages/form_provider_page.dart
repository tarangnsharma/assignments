import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// PC 31: Form with two TextFormFields + submit; Provider passes data to another widget.

class FormData extends ChangeNotifier {
  String field1 = '';
  String field2 = '';

  void setData(String a, String b) {
    field1 = a;
    field2 = b;
    notifyListeners();
  }
}

class FormProviderPage extends StatefulWidget {
  const FormProviderPage({super.key});

  @override
  State<FormProviderPage> createState() => _FormProviderPageState();
}

class _FormProviderPageState extends State<FormProviderPage> {
  final _key = GlobalKey<FormState>();
  final _c1 = TextEditingController();
  final _c2 = TextEditingController();
  final FormData _formData = FormData();

  @override
  void dispose() {
    _c1.dispose();
    _c2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FormData>.value(
      value: _formData,
      child: Scaffold(
        appBar: AppBar(title: const Text('PC 31 – Form + Provider')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  controller: _c1,
                  decoration: const InputDecoration(labelText: 'Field 1'),
                  validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _c2,
                  decoration: const InputDecoration(labelText: 'Field 2'),
                  validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      _formData.setData(_c1.text, _c2.text);
                    }
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 24),
                const Expanded(child: _DataDisplay()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DataDisplay extends StatelessWidget {
  const _DataDisplay();

  @override
  Widget build(BuildContext context) {
    return Consumer<FormData>(
      builder: (context, data, _) {
        if (data.field1.isEmpty && data.field2.isEmpty) {
          return const Center(child: Text('Submit the form to see data here.'));
        }
        return SingleChildScrollView(
          child: Center(
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 24),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Submitted data:', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 12),
                    Text('Field 1: ${data.field1}', style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 8),
                    Text('Field 2: ${data.field2}', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
