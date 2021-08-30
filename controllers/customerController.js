const controller = {};

controller.list = (req, res) => {
    req.getConnection((err, conn) => {
        conn.query('SELECT * FROM registro', (err, persons) => {
            if (err) {
                res.json(err);
            }
            res.render('register', {
                data: persons
            });
        });
    });
};

controller.save = (req, res) => {
    const data = req.body;

    req.getConnection((err, conn) => {
        conn.query('INSERT INTO registro set ?', [data], (err, persons) => {
            console.log(persons);
            res.redirect('/');

        });
    });
};

module.exports = controller;