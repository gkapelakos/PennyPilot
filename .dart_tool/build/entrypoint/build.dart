// ignore_for_file: directives_ordering
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:riverpod_generator/builder.dart' as _i2;
import 'package:json_serializable/builder.dart' as _i3;
import 'package:isar_generator/isar_generator.dart' as _i4;
import 'package:source_gen/builder.dart' as _i5;
import 'package:mockito/src/builder.dart' as _i6;
import 'package:build_config/build_config.dart' as _i7;
import 'package:build_resolvers/builder.dart' as _i8;
import 'dart:isolate' as _i9;
import 'package:build_runner/build_runner.dart' as _i10;
import 'dart:io' as _i11;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(
    r'riverpod_generator:riverpod_generator',
    [_i2.riverpodBuilder],
    _i1.toDependentsOf(r'riverpod_generator'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'json_serializable:json_serializable',
    [_i3.jsonSerializable],
    _i1.toDependentsOf(r'json_serializable'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'isar_generator:isar_generator',
    [_i4.getIsarGenerator],
    _i1.toDependentsOf(r'isar_generator'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'source_gen:combining_builder',
    [_i5.combiningBuilder],
    _i1.toNoneByDefault(),
    hideOutput: false,
    appliesBuilders: const [r'source_gen:part_cleanup'],
  ),
  _i1.apply(
    r'mockito:mockBuilder',
    [_i6.buildMocks],
    _i1.toDependentsOf(r'mockito'),
    hideOutput: false,
    defaultGenerateFor: const _i7.InputSet(include: [r'test/**']),
  ),
  _i1.apply(
    r'build_resolvers:transitive_digests',
    [_i8.transitiveDigestsBuilder],
    _i1.toAllPackages(),
    isOptional: true,
    hideOutput: true,
    appliesBuilders: const [r'build_resolvers:transitive_digest_cleanup'],
  ),
  _i1.applyPostProcess(
    r'build_resolvers:transitive_digest_cleanup',
    _i8.transitiveDigestCleanup,
  ),
  _i1.applyPostProcess(
    r'source_gen:part_cleanup',
    _i5.partCleanup,
  ),
];
void main(
  List<String> args, [
  _i9.SendPort? sendPort,
]) async {
  var result = await _i10.run(
    args,
    _builders,
  );
  sendPort?.send(result);
  _i11.exitCode = result;
}
