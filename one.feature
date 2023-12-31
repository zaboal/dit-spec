#language: ru

# Спецификация поведения бота для telegram’а,
# реализующего комментирование сообщний канала в группе с топиками.
# CC-BY-SA 4.0 © Зажигин Богдан, 2023



Функция: Комментирование сообщений канала в группе с топиками
	Сентябрь 2023 года, в Telegram'е нет данной функции.
	Она бы позволяла администраторам каналов
	использовать преимущества групп с топиками,
	а также объединять трафик с другими каналами.

Предыстория:
	Пусть дистрибьютер зарегистировал <бот>а через BotFather
	И получил его <ключ> для Telegram Bot API (TBAPI)
	И запустил <приложен>ие передав <ключ>

	Примеры:
		| бот     | ключ                                          | приложен                 |
		| @ditbot | 4839574812:AAFD39kkdpWt3ywyRZergyOLMaJhac60qc | github.com/zaboal/ditbot |


Правило: <бот> добавлен со всеми необходимыми правами в чат, и инициатор сценария — его админ
	согласно типам TBAPI, канал и группа — чаты

	Структура сценария: Добавление канала в вайтлист группы
		Если админ напишет в группе «/<команд> <канал>»
		Тогда <приложен>ие внесёт <канал> в вайтлист

		Примеры:
			| команд    | групп   | канал   |
			| whitelist | @zbagab | @zbalog |


	Структура сценария: Активирование канала в топиках группы
		Пусть <канал> есть в вайтлисте <групп>ы
		Если админ <канал>а напишет боту «/<команд> <канал> <групп>»
		Тогда <бот> создаст одноимённый с <канал>ом <топик> в <групп>е
		И пометит в базе данных как обслуживаемый

		Примеры:
			| команд   | канал   | групп   | топик           |
			| activate | @zbalog | @zbagab | находки забоала |


Структура сценария: Привязка постов к группе
	Пусть <канал> помечен как обслуживаемый <групп>ой
	Когда в <канал> отправляется сообщение
	Тогда <бот> его копирует
	И удаляет из канала
	И прогнозирует <ссылк>у на репост в <групп>е
	И добавляет кнопку с данной <ссылк>ой
	И отправляет в <канал> и <топик>


Структура сценария: Комментирование поста
	Пусть <пост> привязан к группе
	Когда <пользовател>ь нажимает на кнопку под ним
	Тогда его перенаправляет к его <репост>у в <чат>е

	Примеры:
		| пост       | пользовател | репост       | чат    |
		| zbalog/150 | zaboal      | ditgab/13/29 | ditgab |
