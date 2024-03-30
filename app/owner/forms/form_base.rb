class Forms::FormBase
	include ActiveModel::Model
	include ActiveModel::Attributes
	include ActiveModel::Validations

	# 属性のハッシュをattributes変数に定義
	def initialize(attributes: nil)
		attributes ||= default_attributes
		super(attributes)
	end

	# サブクラスのdelegateで対象モデルへ送るため処理を含まないようにする
	def id
		nil
	end

	# サブクラスのdelegateで対象モデルへ送るため処理を含まないようにする
	def persisted?
		false
	end

	# 更新処理の流れ
	# 1. Controllerからはスーパークラスの共通インターフェイス(save)が呼で受ける
	# 2. サブクラスのpersistで更新処理を実行
	# 3. スーパークラスのsaveメソッドでRecordInvalid以外のActiveRecordのエラーを補足する
	def save
		valid? ? persist : false
	rescue ActiveRecord::ActiveRecordError => e
		Rails.logger.error([e.message, *e.backtrace].join($/))
		errors.add(:base, e.message)

		false
	end

	private

	def default_attributes
		{}
	end

	def persist
	true
	end
	
end