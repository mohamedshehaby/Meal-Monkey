part of '../home_screen.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.deliveringTo,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            if (state is LocationLoaded) {
              return Text(
                "${state.point.longitude.toStringAsFixed(2)}, ${state.point.longitude.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.titleMedium,
              );
            }
            return Text(AppStrings.currentLocation, style: Theme.of(context).textTheme.titleMedium);
          },
        )
      ],
    );
  }
}
