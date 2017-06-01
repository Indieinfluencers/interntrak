class JournalEntriesController < ApplicationController
  before_action :require_intern, only: [:new, :create, :edit, :update]
  before_action :require_intern_or_admin, only: [:show]
  before_action :find_journal_entry, only: [:edit, :show, :update]

  def new
    @entry = JournalEntry.new
  end

  def create
    @entry = JournalEntry.new(journal_params)
    @entry.author = current_user

    if @entry.save
      flash[:success] = "Journal entry successfully saved"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @entry.update(journal_params)
      flash[:success] = "Journal entry successfully updated"
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def find_journal_entry
    if current_user.admin?
      @entry = JournalEntry.find(params[:id])
    else
      @entry = current_user.journal_entries.find(params[:id])
    end
  end

  def journal_params
    params.require(:journal_entry).permit(:date_for, :content)
  end
end
