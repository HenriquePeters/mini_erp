import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;
  bool _remember = false;

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Como é UI estática, só navegamos para o dashboard provisório
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isWide = mq.size.width > 600;

    final logo = Column(
      children: [
        const Icon(Icons.business_center, size: 84),
        const SizedBox(height: 12),
        Text(
          'Sua Empresa AQUI',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          'Gestão empresarial simplificada',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
              ),
        ),
      ],
    );

    final form = Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _userCtrl,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Usuário ou e-mail',
              prefixIcon: Icon(Icons.person_outline),
            ),
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'Informe seu usuário ou e-mail';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passCtrl,
            obscureText: _obscure,
            decoration: InputDecoration(
              labelText: 'Senha',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                onPressed: () => setState(() => _obscure = !_obscure),
                icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            validator: (v) {
              if (v == null || v.isEmpty) return 'Informe sua senha';
              if (v.length < 4) return 'A senha deve ter ao menos 4 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Checkbox(
                value: _remember,
                onChanged: (val) => setState(() => _remember = val ?? false),
              ),
              const Text('Lembrar de mim'),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text('Esqueci minha senha'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton(
              onPressed: _submit,
              child: const Text('Entrar'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.person_add_alt_1_outlined),
              label: const Text('Criar conta (mock)'),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Este app é uma simulação de UI (sem backend).',
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );

    // Layout responsivo: centralizado em telas estreitas; card dividido em telas largas
    final content = isWide
        ? Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 920),
              child: Card(
                elevation: 1,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // Lado esquerdo com imagem/branding
                    Expanded(
                      child: Container(
                        height: 520,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).colorScheme.primaryContainer,
                              Theme.of(context).colorScheme.surface,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            logo,
                            const SizedBox(height: 24),
                            const Icon(Icons.analytics_outlined, size: 72),
                            const SizedBox(height: 12),
                            Text(
                              'Controle de vendas, estoque e finanças\nna palma da mão.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Lado direito com formulário
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints:
                                const BoxConstraints(maxWidth: 420, minHeight: 520),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Acesse sua conta',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                form,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Column(
                  children: [
                    logo,
                    const SizedBox(height: 24),
                    Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: form,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

    return Scaffold(body: content);
  }
}
