part of '../location_screen.dart';

class LocationSearchBox extends StatelessWidget {
  const LocationSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.s12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            width: AppSize.s60.w,
            height: AppSize.s60.h,
            ImageAssets.logoIcon,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: AppSize.s12.w,
          ),
          Expanded(
            child: Column(
              children: [
                TextField(
                  onChanged: (input) {
                    context.read<PlacesBloc>().add(PlacesLoadEvent(place: input));
                  },
                  decoration: const InputDecoration(
                    hintText: AppStrings.enterYourLocation,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                BlocBuilder<PlacesBloc, PlacesState>(
                  builder: (context, state) {
                    if (state is PlacesLoaded) {
                      final places = state.places;
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: AppSize.s8.h),
                        color: AppColor.black.withOpacity(0.6),
                        height: places.length * AppSize.s28.h,
                        child: ListView.builder(
                          itemCount: places.length,
                          itemBuilder: (context, index) {
                            final address = places[index].address;
                            final point = places[index].point;
                            final country = address?.country;
                            final city = address?.city;
                            if (address != null && point != null) {
                              return Padding(
                                padding: EdgeInsets.all(AppSize.s8.h),
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<LocationBloc>()
                                        .add(LocationUpdateLocation(point: point));
                                  },
                                  child: Row(
                                    children: [
                                      if (country != null)
                                        Text(
                                          "$country ",
                                          style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                      if (city != null)
                                        Expanded(
                                          child: Text(
                                            "$city ",
                                            style: Theme.of(context).textTheme.titleSmall,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            }
                            return null;
                          },
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
