local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    -- DRF Serializer
    s("drfserializer", {
        t("from rest_framework import serializers"),
        t({"", "", "class "}), i(1, "YourModelSerializer"), t("(serializers.ModelSerializer):"),
        t({"", "  class Meta:", "    model = "}), i(2, "YourModel"), t({",", "    fields = '__all__'", "", "  # Add other fields as needed."}),
    }),

    -- DRF Model
    s("drfmodel", {
        t("from django.db import models"),
        t({"", "", "class "}), i(1, "YourModel"), t("(models.Model):"),
        t({"", "  name = models.CharField(max_length=255)"}),
        t({"", "  description = models.TextField()"}),
        t({"", "  def __str__(self):", "    return self.name"}),
    }),

    -- DRF ViewSet
    s("drfviewset", {
        t("from rest_framework import viewsets"),
        t({"", "from .serializers import "}), i(1, "YourModelSerializer"),
        t({"", "", "class "}), i(2, "YourModelViewSet"), t("viewsets.ModelViewSet):"),
        t({"", "  queryset = "}), i(3, "YourModel.objects.all()"),
        t({"", "  serializer_class = "}), i(4, "YourModelSerializer"), 
    }),

    -- DRF APIView
    s("drfapi", {
        t("from rest_framework.views import APIView"),
        t({"", "from rest_framework.response import Response", "from rest_framework import status"}),
        t({"", "", "class "}), i(1, "YourAPIView"), t("APIView):"),
        t({"", "  def get(self, request):", "    data = {'message': 'Hello, world!'}", "    return Response(data, status=status.HTTP_200_OK)"}),
    }),

    -- DRF URL Routing
    s("drfurls", {
        t("from django.urls import path"),
        t({"", "from .views import "}), i(1, "YourModelViewSet"),
        t({"", "", "urlpatterns = ["}),
        t({"", "  path('api/', YourModelViewSet.as_view({'get': 'list'})),", "  # Add other routes here"}),
        t({"", "]"}),
    }),

    -- DRF Authentication (JWT Token)
    s("drfjwt", {
        t("from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView"),
        t({"", "", "urlpatterns = ["}),
        t({"", "  path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),", "  path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),"}),
        t({"", "]"}),
    }),

    -- DRF Permissions
    s("drfpermissions", {
        t("from rest_framework.permissions import IsAuthenticated"),
        t({"", "", "class "}), i(1, "YourViewSet"), t("viewsets.ModelViewSet):"),
        t({"", "  permission_classes = [IsAuthenticated]"}),
        t({"", "  # Add your queryset and serializer class here."}),
    }),

    -- DRF Generic Views (ListAPIView)
    s("drflist", {
        t("from rest_framework.generics import ListAPIView"),
        t({"", "from .models import "}), i(1, "YourModel"),
        t({"", "from .serializers import "}), i(2, "YourModelSerializer"),
        t({"", "", "class "}), i(3, "YourModelListView"), t("ListAPIView):"),
        t({"", "  queryset = "}), i(4, "YourModel.objects.all()"),
        t({"", "  serializer_class = "}), i(5, "YourModelSerializer"), 
    }),

    -- DRF Generic Views (CreateAPIView)
    s("drfcreate", {
        t("from rest_framework.generics import CreateAPIView"),
        t({"", "from .models import "}), i(1, "YourModel"),
        t({"", "from .serializers import "}), i(2, "YourModelSerializer"),
        t({"", "", "class "}), i(3, "YourModelCreateView"), t("CreateAPIView):"),
        t({"", "  queryset = "}), i(4, "YourModel.objects.all()"),
        t({"", "  serializer_class = "}), i(5, "YourModelSerializer"), 
    }),

    -- DRF UpdateAPIView
    s("drfupdate", {
        t("from rest_framework.generics import UpdateAPIView"),
        t({"", "from .models import "}), i(1, "YourModel"),
        t({"", "from .serializers import "}), i(2, "YourModelSerializer"),
        t({"", "", "class "}), i(3, "YourModelUpdateView"), t("UpdateAPIView):"),
        t({"", "  queryset = "}), i(4, "YourModel.objects.all()"),
        t({"", "  serializer_class = "}), i(5, "YourModelSerializer"),
    }),

    -- DRF DestroyAPIView
    s("drfdestroy", {
        t("from rest_framework.generics import DestroyAPIView"),
        t({"", "from .models import "}), i(1, "YourModel"),
        t({"", "from .serializers import "}), i(2, "YourModelSerializer"),
        t({"", "", "class "}), i(3, "YourModelDeleteView"), t("DestroyAPIView):"),
        t({"", "  queryset = "}), i(4, "YourModel.objects.all()"),
        t({"", "  serializer_class = "}), i(5, "YourModelSerializer"),
    }),

    -- DRF Permissions (Custom Permissions)
    s("drfcustomperm", {
        t("from rest_framework import permissions"),
        t({"", "", "class "}), i(1, "IsOwnerOrReadOnly"), t("(permissions.BasePermission):"),
        t({"", "  def has_permission(self, request, view):", "    # Custom permission logic goes here.", "    pass"}),
    }),

    -- DRF API Throttling
    s("drfthrottle", {
        t("from rest_framework.throttling import UserRateThrottle"),
        t({"", "", "class "}), i(1, "BurstThrottle"), t("(UserRateThrottle):"),
        t({"", "  rate = '5/min'"}),
    }),

    -- DRF Router Setup (SimpleRouter)
    s("drfrouter", {
        t("from rest_framework.routers import DefaultRouter"),
        t({"", "from .views import "}), i(1, "YourModelViewSet"),
        t({"", "", "router = DefaultRouter()"}),
        t({"", "router.register('yourmodel', YourModelViewSet)"}),
        t({"", "urlpatterns = router.urls"}),
    }),

    -- DRF Authentication (Token Auth)
    s("drftokenauth", {
        t("from rest_framework.authentication import TokenAuthentication"),
        t({"", "", "class "}), i(1, "YourViewSet"), t("(viewsets.ModelViewSet):"),
        t({"", "  authentication_classes = [TokenAuthentication]"}),
        t({"", "  # Add your queryset and serializer class here."}),
    }),

    -- DRF Model Permission
    s("drfmodelperm", {
        t("from rest_framework.permissions import BasePermission"),
        t({"", "", "class "}), i(1, "YourModelPermission"), t("(BasePermission):"),
        t({"", "  def has_object_permission(self, request, view, obj):", "    # Implement object-level permission logic here.", "    pass"}),
    }),

    -- DRF Filter Backends (Example with DjangoFilterBackend)
    s("drffilter", {
        t("from rest_framework.filters import DjangoFilterBackend"),
        t({"", "", "class "}), i(1, "YourModelViewSet"), t("(viewsets.ModelViewSet):"),
        t({"", "  filter_backends = [DjangoFilterBackend]"}),
        t({"", "  filterset_fields = ['name', 'description']"}),
    }),

    -- DRF Pagination (PageNumberPagination)
    s("drfpagination", {
        t("from rest_framework.pagination import PageNumberPagination"),
        t({"", "", "class "}), i(1, "CustomPagination"), t("(PageNumberPagination):"),
        t({"", "  page_size = 10", "  page_size_query_param = 'page_size'", "  max_page_size = 100"}),
    }),

    -- DRF Model Serializer with Nested Serializer
    s("drfnestedserializer", {
        t("from rest_framework import serializers"),
        t({"", "class "}), i(1, "ChildModelSerializer"), t("(serializers.ModelSerializer):"),
        t({"", "  class Meta:", "    model = "}), i(2, "ChildModel"), t({",", "    fields = '__all__'"}),
        t({"", "class "}), i(3, "ParentModelSerializer"), t("(serializers.ModelSerializer):"),
        t({"", "  child = ChildModelSerializer()"}),
        t({"", "  class Meta:", "    model = "}), i(4, "ParentModel"), t({",", "    fields = '__all__'"}),
    }),

    -- DRF ViewSet with SearchFilter
    s("drfsearch", {
        t("from rest_framework.filters import SearchFilter"),
        t({"", "", "class "}), i(1, "YourModelViewSet"), t("(viewsets.ModelViewSet):"),
        t({"", "  filter_backends = [SearchFilter]"}),
        t({"", "  search_fields = ['name', 'description']"}),
    }),

    -- DRF Custom Authentication Class (SessionAuth, BasicAuth)
    s("drfcustomauth", {
        t("from rest_framework.authentication import SessionAuthentication, BasicAuthentication"),
        t({"", "", "class "}), i(1, "CustomAuthentication"), t("(SessionAuthentication, BasicAuthentication):"),
        t({"", "  def authenticate(self, request):", "    # Custom authentication logic goes here.", "    pass"}),
    }),

    -- DRF Custom Filter (with Multiple Fields)
    s("drfmultifilter", {
        t("from rest_framework import filters"),
        t({"", "from .models import "}), i(1, "YourModel"),
        t({"", "from .serializers import "}), i(2, "YourModelSerializer"),
        t({"", "", "class "}), i(3, "YourModelViewSet"), t("(viewsets.ModelViewSet):"),
        t({"", "  filter_backends = [filters.OrderingFilter, filters.SearchFilter]"}),
        t({"", "  ordering_fields = ['name', 'created_at']", "  search_fields = ['name', 'description']"}),
        t({"", "  queryset = "}), i(4, "YourModel.objects.all()"),
        t({"", "  serializer_class = "}), i(5, "YourModelSerializer"),
    }),

    -- DRF Serializer with Validation
    s("drfvalidate", {
        t("from rest_framework import serializers"),
        t({"", "class "}), i(1, "YourModelSerializer"), t("(serializers.ModelSerializer):"),
        t({"", "  class Meta:", "    model = "}), i(2, "YourModel"), t({",", "    fields = '__all__'"}),
        t({"", "  def validate_name(self, value):", "    if len(value) < 3:", "      raise serializers.ValidationError('Name must be at least 3 characters long.')", "    return value"}),
    }),

    -- DRF ViewSet with Custom Action
    s("drfaction", {
        t("from rest_framework.decorators import action"),
        t({"", "from rest_framework.response import Response"}),
        t({"", "", "class "}), i(1, "YourModelViewSet"), t("(viewsets.ModelViewSet):"),
        t({"", "  @action(detail=True, methods=['post'])"}),
        t({"", "  def custom_action(self, request, pk=None):"}),
        t({"", "    # Custom action logic goes here."}),
        t({"", "    return Response({'status': 'success'})"}),
    }),

    -- DRF Custom Pagination (LimitOffsetPagination)
    s("drflimitoffset", {
        t("from rest_framework.pagination import LimitOffsetPagination"),
        t({"", "", "class "}), i(1, "CustomLimitOffsetPagination"), t("(LimitOffsetPagination):"),
        t({"", "  default_limit = 10", "  max_limit = 100"}),
    }),

    -- DRF Generic View with FilterSet (django-filters)
    s("drffilterset", {
        t("from rest_framework import generics"),
        t({"", "from .models import "}), i(1, "YourModel"),
        t({"", "from .serializers import "}), i(2, "YourModelSerializer"),
        t({"", "from django_filters import rest_framework as filters"}),
        t({"", "", "class "}), i(3, "YourModelFilter"), t("(filters.FilterSet):"),
        t({"", "  name = filters.CharFilter(lookup_expr='icontains')"}),
        t({"", "  class Meta:", "    model = "}), i(4, "YourModel"), t({",", "    fields = ['name', 'description']"}),
        t({"", "", "class "}), i(5, "YourModelListView"), t("(generics.ListAPIView):"),
        t({"", "  queryset = "}), i(6, "YourModel.objects.all()"),
        t({"", "  serializer_class = "}), i(7, "YourModelSerializer"),
        t({"", "  filter_backends = (filters.DjangoFilterBackend,)"})
    }),

    -- DRF Multiple Serializer Views
    s("drfmultiserializer", {
        t("from rest_framework import serializers"),
        t({"", "class "}), i(1, "YourModelSerializer"), t("(serializers.ModelSerializer):"),
        t({"", "  class Meta:", "    model = "}), i(2, "YourModel"), t({",", "    fields = '__all__'"}),
        t({"", "class "}), i(3, "OtherModelSerializer"), t("(serializers.ModelSerializer):"),
        t({"", "  class Meta:", "    model = "}), i(4, "OtherModel"), t({",", "    fields = '__all__'"}),
        t({"", "", "class "}), i(5, "CustomViewSet"), t("(viewsets.ViewSet):"),
        t({"", "  def list(self, request):", "    data1 = YourModel.objects.all()", "    data2 = OtherModel.objects.all()"}),
        t({"", "    return Response({", "      'data1': YourModelSerializer(data1, many=True).data,", "      'data2': OtherModelSerializer(data2, many=True).data", "    })"}),
    }),

    -- DRF Serializer with HyperlinkedModelSerializer
    s("drfhyperlinked", {
        t("from rest_framework import serializers"),
        t({"", "class "}), i(1, "YourModelSerializer"), t("(serializers.HyperlinkedModelSerializer):"),
        t({"", "  class Meta:", "    model = "}), i(2, "YourModel"), t({",", "    fields = ['url', 'name', 'description']"}),
    }),

    -- DRF File Upload with Serializer
    s("drfupload", {
        t("from rest_framework import serializers"),
        t({"", "class "}), i(1, "FileUploadSerializer"), t("(serializers.Serializer):"),
        t({"", "  file = serializers.FileField()"}),
        t({"", "", "class "}), i(2, "FileUploadView"), t("(APIView):"),
        t({"", "  def post(self, request):", "    serializer = FileUploadSerializer(data=request.data)", "    if serializer.is_valid():", "      file = serializer.save()", "      return Response({'status': 'success', 'file': file.name})"}),
    }),

    -- DRF Serializer with dynamic field insertion based on model input
    s("drfdynamic", {
        t("class "), i(1, "DynamicSerializer"), t("(serializers.ModelSerializer):"),
        t({"", "  class Meta:", "    model = "}), i(2, "YourModel"), t({",", "    fields = ["}),
        f(function(_, snip)
            local model_name = snip.env.TM_SELECTED_TEXT or "YourModel"
            -- Custom logic to determine model fields or relationships based on model name
            return model_name == "YourModel" and "'name', 'description', 'created_at'" or "'id', 'title'"
        end, {}),
        t({"]", "  }"}),
    }),

    -- DRF View with Dynamic Serializer Selection
    s("drfviewdynamic", {
        t("class "), i(1, "DynamicModelViewSet"), t("(viewsets.ModelViewSet):"),
        t({"", "  queryset = "}), i(2, "YourModel.objects.all()"),
        t({"", "  serializer_class = "}), f(function(_, snip)
            local model_name = snip.env.TM_SELECTED_TEXT or "YourModel"
            return model_name == "YourModel" and "DynamicSerializer" or "AnotherSerializer"
        end, {}),
    }),
}
