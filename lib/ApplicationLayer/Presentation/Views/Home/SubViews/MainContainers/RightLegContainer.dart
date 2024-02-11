import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/Views/Home/SubViews/LegRow/LegRowView.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/AssetsManager.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/StringManager.dart';
import 'package:smart_shoes/Data/Providers/LegSensorsProviders.dart';
import 'package:smart_shoes/Data/Providers/ConstantCircleProviders.dart';

import '../../../../_Resources/ColorManager.dart';
import '../../../../_Resources/ValueManager.dart';

class RightLegContainer extends StatelessWidget {
  const RightLegContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Consumer(
            builder: (context, ref, child) => Container(
                decoration: BoxDecoration(
              color: ref
                  .watch(circleContainerColorProvider([
                    ref.watch(circleProviderRTH).circleEntity,
                    ref.watch(circleProviderRTO).circleEntity,
                    ref.watch(circleProviderRLH).circleEntity,
                    ref.watch(circleProviderRLO).circleEntity,
                    ref.watch(circleProviderRFH).circleEntity,
                    ref.watch(circleProviderRFO).circleEntity,
                  ]))
                  .containerColor,
              borderRadius: BorderRadius.circular(16),
            )),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(StringManager.rightLegSensors,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontStyle: FontStyle.italic)),
            const Divider(
                thickness: 1,
                color: ColorManager.onSurface,
                endIndent: AppSizeManager.s16,
                indent: AppSizeManager.s16),
            Consumer(
              builder: (context, ref, child) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: LegRowView(
                    circle1: ref.watch(circleProviderRTH),
                    circle2: ref.watch(circleProviderRTO),
                    image: const AssetImage(ImageAssetsManager.LeftThigh),
                    desc: StringManager.thigh),
              ),
            ),
            Consumer(
              builder: (context, ref, child) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: LegRowView(
                    circle1: ref.watch(circleProviderRLH),
                    circle2: ref.watch(circleProviderRLO),
                    image: const AssetImage(ImageAssetsManager.LeftLeg),
                    desc: StringManager.leg),
              ),
            ),
            Consumer(
              builder: (context, ref, child) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: LegRowView(
                    circle1: ref.watch(circleProviderRFH),
                    circle2: ref.watch(circleProviderRFO),
                    image: const AssetImage(ImageAssetsManager.LeftFeet),
                    desc: StringManager.feet),
              ),
            )
          ],
        ),
      ],
    );
  }
}
