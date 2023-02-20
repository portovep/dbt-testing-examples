# Context

Gym App Ltd has expanded to a new country, the UK. As part of the expansion, the backend team has added support for imperial system a.k.a 'pounds' and 'inches'.

A product manager just opened a support ticket because their health analytics dashboard stopped working. We started debugging this issue and spotted that one of the data quality tests is failing for the health-insights data app (a.k.a data product).

Our transformation code only supports the metric system. We put one of our pairs to work on the new requirements

- Support inches for height measurements
- Support pounds for weight measurements
- Make sure that the BMI calculation works correctly for imperial units.
