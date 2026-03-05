db = db.getSiblingDB("organizer");

db.createUser({
    user: "organizer_user",
    pwd: "xNcHj1joOxoOnE5zsyQiRctZQaumfg",
    roles: [
        {
            role: 'readWrite',
            db: 'organizer'
        },
    ],
});

db.createCollection("users");

db.users.insertMany([
    {
        firstname: 'TEST',
        lastname: 'User1',
        email: 'test-user1@gmail.com',
        password: 'test-test-test-test',
    },
    {
        firstname: 'TEST',
        lastname: 'User2',
        email: 'test-user2@gmail.com',
        password: 'test-test-test-test',
    },
    {
        firstname: 'TEST',
        lastname: 'User3',
        email: 'test-user3@gmail.com',
        password: 'test-test-test-test',
    },
]);