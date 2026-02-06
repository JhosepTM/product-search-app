import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/utils/talker_util.dart';
import 'package:frontend/features/settings/presentation/blocs/bloc/settings_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        elevation: 0,
      ),
      body: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state.status == SettingsStatus.ERROR_UPDATING_VISUAL_SETTING) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Error al actualizar configuración')),
            );
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Tema
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return ListTile(
                  leading: Icon(
                    state.visualSetting.darkModeActive
                        ? Icons.dark_mode
                        : Icons.light_mode,
                  ),
                  title: const Text('Tema'),
                  subtitle: Text(
                    state.visualSetting.darkModeActive ? 'Oscuro' : 'Claro',
                  ),
                  trailing: Switch(
                    value: state.visualSetting.darkModeActive,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.upsertVisualSetting(
                              visualSetting: state.visualSetting
                                  .copyWith(darkModeActive: value),
                            ),
                          );
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Idioma'),
              subtitle: const Text('Español'),
              onTap: () {
                // TODO: Implementar cambio de idioma
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Acerca de'),
              onTap: () {
                // TODO: Mostrar información de la app
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacidad'),
              onTap: () {
                // TODO: Mostrar política de privacidad
              },
            ),
            // Solo mostrar en modo debug
            if (kDebugMode) ...[
              const Divider(),
              ListTile(
                leading: const Icon(Icons.bug_report),
                title: const Text('Ver Logs'),
                subtitle: const Text('Historial de eventos y errores'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => TalkerScreen(talker: talker),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

