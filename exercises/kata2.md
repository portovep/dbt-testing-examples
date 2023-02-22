# Kata 2: Categorize body mass index (BMI) following WHO guidelines

Our product managers are super happy with the health insights data product. They are able to quickly check at a glance what is the "health" of the users of our gym mobile app. One of the product managers has suggested to categorize the BMI based on the categorization issued by the World Health Organization (WHO).

We told her that is a great idea and we put one of our pairs working on it. The new requirements are:

- Add a new attribute to our health insights to indicate the bmi category. The agreed name is 'bmi_category'
- Category should be 'underweight' if BMI < 18.5
- Category should be 'normal' if BMI >= 18.5 and BMI < 25.0
- Category should be 'overweight' if BMI >= 25.0
