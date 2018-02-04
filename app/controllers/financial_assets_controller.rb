class FinancialAssetsController < ApplicationController

  def index
    financial_assets = FinancialAsset.all
    render locals: { financial_assets: financial_assets }
  end

  def new
    financial_asset = FinancialAsset.new
    render locals: { financial_asset: financial_asset }
  end

  def show
    render locals: { financial_asset: financial_asset }
  end

  def edit
    render locals: { financial_asset: financial_asset }
  end

  def create
    financial_asset = FinancialAsset.new(financial_asset_params)
    if financial_asset.save
      redirect_to financial_asset, message: "FinancialAsset created"
    else
      render new, locals: { financial_asset: financial_asset }
    end
  end

  def update
    if financial_asset.update_attributes(financial_asset_attributes)
      redirect_to financial_asset, message: "FinancialAsset update"
    else
      render edit, locals: { financial_asset: financial_asset }
    end
  end

  private

  def financial_asset_params
    params.require(:financial_asset).permit(:ticker_code, :quandl_address)
  end

  def financial_asset
    @_financial_asset ||= FinancialAsset.find(params[:id])
  end
end
