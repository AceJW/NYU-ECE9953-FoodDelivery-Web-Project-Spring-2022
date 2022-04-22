var app = new Vue({
    el: '#dribbleShot',
    data: {
        title: 'Chukwudi',
        activeCategory: 1,
        categories: [
            {
                id: 1,
                text: 'All',
                icon: 'https://image.flaticon.com/icons/svg/1046/1046874.svg',
                isActive: true
            },
            {
                id: 2,
                text: 'Pizza',
                icon: 'https://image.flaticon.com/icons/svg/766/766226.svg',
                isActive: false
            },
            {
                id: 3,
                text: 'Asian',
                icon: 'https://image.flaticon.com/icons/svg/2689/2689335.svg',
                isActive: false
            },
            {
                id: 4,
                text: 'Burgers',
                icon: 'https://image.flaticon.com/icons/svg/260/260077.svg',
                isActive: false
            },
            {
                id: 5,
                text: 'Barbecue',
                icon: 'https://image.flaticon.com/icons/svg/1161/1161684.svg',
                isActive: false
            },
            {
                id: 6,
                text: 'Desserts',
                icon: 'https://image.flaticon.com/icons/svg/1784/1784077.svg',
                isActive: false
            },
            {
                id: 7,
                text: 'Thai',
                icon: 'https://image.flaticon.com/icons/svg/2321/2321808.svg',
                isActive: false
            },
            {
                id: 8,
                text: 'Sushi',
                icon: 'https://image.flaticon.com/icons/svg/2558/2558357.svg',
                isActive: false
            }
        ],
        foodItems: [
            {
                title: 'Bagel Story',
                image: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/25008305-442083466194421-4458779521922891776-n-1517333246.jpg?crop=1xw:1xh;center,top&resize=480:*',
                prepTimeValue: '25 - 30',
                prepTimeUnit: 'min',
                rating: 4.7,
                cat1: 'Deli',
                cat2: 'Bagels',
                range: '$$'
            },
            {
                title: 'Dessert Rose',
                image: 'https://images.mygoodtimes.in/wp-content/uploads/2018/12/08210525/Bakers-Copy.jpg',
                prepTimeValue: '30 - 35',
                prepTimeUnit: 'min',
                rating: 4.5,
                cat1: 'Cafes',
                cat2: 'Desserts',
                range: '$'
            },
            {
                title: 'Barbecue Nation',
                image: 'https://chowhound1.cbsistatic.com/thumbnail/370/0/chowhound1.cbsistatic.com/assets/2012/08/30453_RecipeImage_620x413_grilled_chicken_nectarine.jpg',
                prepTimeValue: '40 - 60',
                prepTimeUnit: 'min',
                rating: 4.6,
                cat1: 'Barbecue',
                cat2: 'Chicken',
                range: '$$$'
            }
        ],
        cartItems: [
            {
                title: 'BBQ Burger',
                image: 'https://hips.hearstapps.com/pop.h-cdn.co/assets/cm/15/05/54ca71fb94ad3_-_5summer_skills_burger_470_0808-de.jpg?crop=1xw:1.0xh;center,top&resize=480:*',
                quantity: 1,
                price: 14.99
            },
            {
                title: 'French Fries',
                image: 'https://recipes.timesofindia.com/thumb/54659021.cms?width=1200&height=1200',
                quantity: 1,
                price: 9.99
            },
            {
                title: 'Cheese Sauce',
                image: 'https://www.pepperscale.com/wp-content/uploads/2017/10/spicy-nacho-cheese.jpeg',
                quantity: 1,
                price: 0.99
            }
        ]
    }
});