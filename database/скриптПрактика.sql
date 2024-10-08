-- ПРИОРИТЕТ
DROP TABLE IF EXISTS priority;
CREATE TABLE priority (
	ID SERIAL PRIMARY KEY,
	title VARCHAR(20) NOT NULL,
	description TEXT NOT NULl
);

INSERT INTO priority VALUES
(1, 'Низкий', 'Данная проблема не влечет потери работоспособности Системы. Это незначительная ошибка или неудобство, которые не препятствуют проведению операций в Системе'),
(2, 'Средний', 'Проблема влечет за собой несущественную потерю работоспособности Системы, следствием чего является неудобство в работе или необходимость использовать альтернативные или обходные пути решения'),
(3, 'Высокий', 'Проблема влечет за собой значительную потерю работоспособности Системы. Критические функции Системы становятся недоступными, и нет применимого обходного пути решения, однако, Система сохраняет работоспособность в ограниченном объёме, и работы по решению будут вестись в рабочее время'),
(4, 'Наивысший', 'Проблема влечёт за собой остановку или полную потерю работоспособности Системы. Становятся недоступны основные функции Системы и ситуация является критической');
-- выводим информацию из таблицы с приоритетами
-- SELECT * FROM priority;


-- СТАТУС
DROP TABLE IF EXISTS status;
CREATE TABLE status (
	ID SERIAL PRIMARY KEY,
	title VARCHAR(20) NOT NULL,
	description TEXT NOT NULL
);

INSERT INTO status VALUES
(1, 'К выполнению', 'Статус присваивается задаче, которая назначена пользователю. Это первый этап работы над задачей и именно на этот статус попадает большинство задач после их создания'),
(2, 'В работе', 'Именно этот статус присваивается, если пользователь приступил к выполнению'),
(3, 'Выполнен', 'Данный статус имеет задача, работы над которой завершены');
-- выводим информацию из таблицы с приоритетами
-- SELECT * FROM status;


-- КЛИЕНТ
DROP TABLE IF EXISTS client;
CREATE TABLE client (
	ID SERIAL PRIMARY KEY ON DELETE CASCADE ON UPDATE CASCADE,
	firstname VARCHAR(40) NOT NULL,
	lastname VARCHAR(40) NOT NULL,
	middlename VARCHAR(40) NOT NULL,
	contact_details VARCHAR(20) NOT NULL,
	address_id INTEGER NOT NULL
	--FOREIGN KEY(address_id) REFERENCES client_address(ID)
);

INSERT INTO client VALUES
(1, 'Мамаев', 'Илья', 'Евгеньевич', '+79935221012', 1),
(2, 'Сайфуллин', 'Нияз', 'Филлусович', '+79530035048', 2),
(3, 'Лаптев', 'Алексей', 'Анатольевич', '+79530411133', 3),
(4, 'Зведенинов', 'Евгений', 'Алексеевич', '+79025003413', 4),
(5, 'Мамаев', 'Артем', 'Евгеньевич', '+79530461817', 5),
(6, 'Степанова', 'Дана', 'Андреевна', '+79041788162', 6),
(7, 'Берник', 'Лика', 'Андреевна', '+79026121341', 7),
(8, 'Миллер', 'Кристина', 'Андреевна', '+7912104500', 8),
(9, 'Королев', 'Максим', 'Анатольевич', '+79035003412', 1),
(10, 'Сагадатова', 'Алина', 'Михайловна', '+7993512123', 1);

SELECT * FROM client;
