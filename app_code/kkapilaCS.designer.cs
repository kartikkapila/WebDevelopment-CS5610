﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18444
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace edu.neu.ccis.kkapila.kkapilaCS
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="kkapila")]
	public partial class kkapilaCSDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertFavorite(Favorite instance);
    partial void UpdateFavorite(Favorite instance);
    partial void DeleteFavorite(Favorite instance);
    partial void Insertproj_like(proj_like instance);
    partial void Updateproj_like(proj_like instance);
    partial void Deleteproj_like(proj_like instance);
    partial void Insertproj_user(proj_user instance);
    partial void Updateproj_user(proj_user instance);
    partial void Deleteproj_user(proj_user instance);
    partial void InsertTopMovy(TopMovy instance);
    partial void UpdateTopMovy(TopMovy instance);
    partial void DeleteTopMovy(TopMovy instance);
    #endregion
		
		public kkapilaCSDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["kkapilaCS"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public kkapilaCSDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public kkapilaCSDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public kkapilaCSDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public kkapilaCSDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<Favorite> Favorites
		{
			get
			{
				return this.GetTable<Favorite>();
			}
		}
		
		public System.Data.Linq.Table<proj_like> proj_likes
		{
			get
			{
				return this.GetTable<proj_like>();
			}
		}
		
		public System.Data.Linq.Table<proj_user> proj_users
		{
			get
			{
				return this.GetTable<proj_user>();
			}
		}
		
		public System.Data.Linq.Table<TopMovy> TopMovies
		{
			get
			{
				return this.GetTable<TopMovy>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Favorites")]
	public partial class Favorite : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _username;
		
		private string _imdbId;
		
		private EntityRef<proj_user> _proj_user;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnusernameChanging(string value);
    partial void OnusernameChanged();
    partial void OnimdbIdChanging(string value);
    partial void OnimdbIdChanged();
    #endregion
		
		public Favorite()
		{
			this._proj_user = default(EntityRef<proj_user>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_username", DbType="VarChar(50) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string username
		{
			get
			{
				return this._username;
			}
			set
			{
				if ((this._username != value))
				{
					if (this._proj_user.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnusernameChanging(value);
					this.SendPropertyChanging();
					this._username = value;
					this.SendPropertyChanged("username");
					this.OnusernameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_imdbId", DbType="VarChar(50) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string imdbId
		{
			get
			{
				return this._imdbId;
			}
			set
			{
				if ((this._imdbId != value))
				{
					this.OnimdbIdChanging(value);
					this.SendPropertyChanging();
					this._imdbId = value;
					this.SendPropertyChanged("imdbId");
					this.OnimdbIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="proj_user_Favorite", Storage="_proj_user", ThisKey="username", OtherKey="username", IsForeignKey=true)]
		public proj_user proj_user
		{
			get
			{
				return this._proj_user.Entity;
			}
			set
			{
				proj_user previousValue = this._proj_user.Entity;
				if (((previousValue != value) 
							|| (this._proj_user.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._proj_user.Entity = null;
						previousValue.Favorites.Remove(this);
					}
					this._proj_user.Entity = value;
					if ((value != null))
					{
						value.Favorites.Add(this);
						this._username = value.username;
					}
					else
					{
						this._username = default(string);
					}
					this.SendPropertyChanged("proj_user");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.proj_likes")]
	public partial class proj_like : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _Id;
		
		private string _username;
		
		private string _quote;
		
		private string _imdbId;
		
		private EntityRef<proj_user> _proj_user;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIdChanging(int value);
    partial void OnIdChanged();
    partial void OnusernameChanging(string value);
    partial void OnusernameChanged();
    partial void OnquoteChanging(string value);
    partial void OnquoteChanged();
    partial void OnimdbIdChanging(string value);
    partial void OnimdbIdChanged();
    #endregion
		
		public proj_like()
		{
			this._proj_user = default(EntityRef<proj_user>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int Id
		{
			get
			{
				return this._Id;
			}
			set
			{
				if ((this._Id != value))
				{
					this.OnIdChanging(value);
					this.SendPropertyChanging();
					this._Id = value;
					this.SendPropertyChanged("Id");
					this.OnIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_username", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string username
		{
			get
			{
				return this._username;
			}
			set
			{
				if ((this._username != value))
				{
					if (this._proj_user.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnusernameChanging(value);
					this.SendPropertyChanging();
					this._username = value;
					this.SendPropertyChanged("username");
					this.OnusernameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_quote", DbType="VarChar(5000) NOT NULL", CanBeNull=false)]
		public string quote
		{
			get
			{
				return this._quote;
			}
			set
			{
				if ((this._quote != value))
				{
					this.OnquoteChanging(value);
					this.SendPropertyChanging();
					this._quote = value;
					this.SendPropertyChanged("quote");
					this.OnquoteChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_imdbId", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string imdbId
		{
			get
			{
				return this._imdbId;
			}
			set
			{
				if ((this._imdbId != value))
				{
					this.OnimdbIdChanging(value);
					this.SendPropertyChanging();
					this._imdbId = value;
					this.SendPropertyChanged("imdbId");
					this.OnimdbIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="proj_user_proj_like", Storage="_proj_user", ThisKey="username", OtherKey="username", IsForeignKey=true)]
		public proj_user proj_user
		{
			get
			{
				return this._proj_user.Entity;
			}
			set
			{
				proj_user previousValue = this._proj_user.Entity;
				if (((previousValue != value) 
							|| (this._proj_user.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._proj_user.Entity = null;
						previousValue.proj_likes.Remove(this);
					}
					this._proj_user.Entity = value;
					if ((value != null))
					{
						value.proj_likes.Add(this);
						this._username = value.username;
					}
					else
					{
						this._username = default(string);
					}
					this.SendPropertyChanged("proj_user");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.proj_users")]
	public partial class proj_user : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _username;
		
		private string _password;
		
		private string _email;
		
		private string _name;
		
		private string _aboutMe;
		
		private int _profileViews;
		
		private string _imgsrc;
		
		private EntitySet<Favorite> _Favorites;
		
		private EntitySet<proj_like> _proj_likes;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnusernameChanging(string value);
    partial void OnusernameChanged();
    partial void OnpasswordChanging(string value);
    partial void OnpasswordChanged();
    partial void OnemailChanging(string value);
    partial void OnemailChanged();
    partial void OnnameChanging(string value);
    partial void OnnameChanged();
    partial void OnaboutMeChanging(string value);
    partial void OnaboutMeChanged();
    partial void OnprofileViewsChanging(int value);
    partial void OnprofileViewsChanged();
    partial void OnimgsrcChanging(string value);
    partial void OnimgsrcChanged();
    #endregion
		
		public proj_user()
		{
			this._Favorites = new EntitySet<Favorite>(new Action<Favorite>(this.attach_Favorites), new Action<Favorite>(this.detach_Favorites));
			this._proj_likes = new EntitySet<proj_like>(new Action<proj_like>(this.attach_proj_likes), new Action<proj_like>(this.detach_proj_likes));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_username", DbType="VarChar(50) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string username
		{
			get
			{
				return this._username;
			}
			set
			{
				if ((this._username != value))
				{
					this.OnusernameChanging(value);
					this.SendPropertyChanging();
					this._username = value;
					this.SendPropertyChanged("username");
					this.OnusernameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_password", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string password
		{
			get
			{
				return this._password;
			}
			set
			{
				if ((this._password != value))
				{
					this.OnpasswordChanging(value);
					this.SendPropertyChanging();
					this._password = value;
					this.SendPropertyChanged("password");
					this.OnpasswordChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_email", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string email
		{
			get
			{
				return this._email;
			}
			set
			{
				if ((this._email != value))
				{
					this.OnemailChanging(value);
					this.SendPropertyChanging();
					this._email = value;
					this.SendPropertyChanged("email");
					this.OnemailChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_name", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string name
		{
			get
			{
				return this._name;
			}
			set
			{
				if ((this._name != value))
				{
					this.OnnameChanging(value);
					this.SendPropertyChanging();
					this._name = value;
					this.SendPropertyChanged("name");
					this.OnnameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_aboutMe", DbType="VarChar(5000) NOT NULL", CanBeNull=false)]
		public string aboutMe
		{
			get
			{
				return this._aboutMe;
			}
			set
			{
				if ((this._aboutMe != value))
				{
					this.OnaboutMeChanging(value);
					this.SendPropertyChanging();
					this._aboutMe = value;
					this.SendPropertyChanged("aboutMe");
					this.OnaboutMeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_profileViews", DbType="Int NOT NULL")]
		public int profileViews
		{
			get
			{
				return this._profileViews;
			}
			set
			{
				if ((this._profileViews != value))
				{
					this.OnprofileViewsChanging(value);
					this.SendPropertyChanging();
					this._profileViews = value;
					this.SendPropertyChanged("profileViews");
					this.OnprofileViewsChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_imgsrc", DbType="VarChar(500)")]
		public string imgsrc
		{
			get
			{
				return this._imgsrc;
			}
			set
			{
				if ((this._imgsrc != value))
				{
					this.OnimgsrcChanging(value);
					this.SendPropertyChanging();
					this._imgsrc = value;
					this.SendPropertyChanged("imgsrc");
					this.OnimgsrcChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="proj_user_Favorite", Storage="_Favorites", ThisKey="username", OtherKey="username")]
		public EntitySet<Favorite> Favorites
		{
			get
			{
				return this._Favorites;
			}
			set
			{
				this._Favorites.Assign(value);
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="proj_user_proj_like", Storage="_proj_likes", ThisKey="username", OtherKey="username")]
		public EntitySet<proj_like> proj_likes
		{
			get
			{
				return this._proj_likes;
			}
			set
			{
				this._proj_likes.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Favorites(Favorite entity)
		{
			this.SendPropertyChanging();
			entity.proj_user = this;
		}
		
		private void detach_Favorites(Favorite entity)
		{
			this.SendPropertyChanging();
			entity.proj_user = null;
		}
		
		private void attach_proj_likes(proj_like entity)
		{
			this.SendPropertyChanging();
			entity.proj_user = this;
		}
		
		private void detach_proj_likes(proj_like entity)
		{
			this.SendPropertyChanging();
			entity.proj_user = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.TopMovies")]
	public partial class TopMovy : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _imdbId;
		
		private int _count;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnimdbIdChanging(string value);
    partial void OnimdbIdChanged();
    partial void OncountChanging(int value);
    partial void OncountChanged();
    #endregion
		
		public TopMovy()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_imdbId", DbType="VarChar(50) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string imdbId
		{
			get
			{
				return this._imdbId;
			}
			set
			{
				if ((this._imdbId != value))
				{
					this.OnimdbIdChanging(value);
					this.SendPropertyChanging();
					this._imdbId = value;
					this.SendPropertyChanged("imdbId");
					this.OnimdbIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_count", DbType="Int NOT NULL")]
		public int count
		{
			get
			{
				return this._count;
			}
			set
			{
				if ((this._count != value))
				{
					this.OncountChanging(value);
					this.SendPropertyChanging();
					this._count = value;
					this.SendPropertyChanged("count");
					this.OncountChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
