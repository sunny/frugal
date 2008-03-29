class ExpensesController < ApplicationController
  # GET /expenses
  # GET /expenses.xml
  def index
    @expenses = Expense.find(:all, :order => 'date DESC', :limit=> 100)
    @title = 'Dépenses'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @expenses }
    end
  end

  # GET /expenses/1
  # GET /expenses/1.xml
  def show
    @expense = Expense.find(params[:id])
    @title = 'Dépense'
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @expense }
    end
  end

  # GET /expenses/new
  # GET /expenses/new.xml
  def new
    @expense = Expense.new
    @title = 'Nouvelle Dépense'

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @expense }
    end
  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.find(params[:id])
    @title = 'Éditer Dépense'
  end

  # POST /expenses
  # POST /expenses.xml
  def create
    @expense = Expense.new(params[:expense])
    @title = 'Éditer Dépense'

    respond_to do |format|
      if @expense.save
        flash[:notice] = 'Nouvelle dépense crée.'
        format.html { redirect_to(:action => "new") }
        format.xml  { render :xml => @expense, :status => :created, :location => @expense }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /expenses/1
  # PUT /expenses/1.xml
  def update
    @expense = Expense.find(params[:id])
    @title = 'Éditer Dépense'
    respond_to do |format|
      if @expense.update_attributes(params[:expense])
        flash[:notice] = 'Dépense mise à jour avec succès.'
        format.html { redirect_to(@expense) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.xml
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to(expenses_url) }
      format.xml  { head :ok }
    end
  end
end
